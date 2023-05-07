#!/bin/bash
#
# This script should be run via curl:
# 1. In Termux:
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Termux/install.sh)"
# or via wget:
#   bash -c "$(wget -qO- https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Termux/install.sh)"
# or via fetch:
#   bash -c "$(fetch -o - https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Termux/install.sh)"
#
# 2. In Linux:
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Linux/install.sh)"
# or via wget:
#   bash -c "$(wget -qO- https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Linux/install.sh)"
# or via fetch:
#   bash -c "$(fetch -o - https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Linux/install.sh)"
#
# As an alternative, you can first download the install script and run it afterwards:
# 1. In Termux:
#   wget https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Termux/install.sh
#   bash install.sh
#
# 2. In Linux:
#   wget https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Linux/install.sh
#   bash install.sh
#
set -e

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"

# Test directory 'cache'
test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || {
  mkdir "$HOME/.cache" >/dev/null 2>&1
}

# Test directory '$PATH'
test -d "$PATH" && test -w "$PATH" && test -x "$PATH" || {
  PATH=$(command -v 'bash' | sed 's|/bash||g')
}

# Default settings
BLIND="${BLIND:-$HOME/.cache/.blind-bash}"
REPO=${REPO:-FajarKim/blind-bash}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

user_can_sudo() {
  # Check if sudo is installed
  command_exists sudo || return 1
  # The following command has 3 parts:
  #
  # 1. Run `sudo` with `-v`. Does the following:
  #    • with privilege: asks for a password immediately.
  #    • without privilege: exits with error code 1 and prints the message:
  #      Sorry, user <username> may not run sudo on <hostname>
  #
  # 2. Pass `-n` to `sudo` to tell it to not ask for a password. If the
  #    password is not required, the command will finish with exit code 0.
  #    If one is required, sudo will exit with error code 1 and print the
  #    message:
  #    sudo: a password is required
  #
  # 3. Check for the words "may not run sudo" in the output to really tell
  #    whether the user has privileges or not. For that we have to make sure
  #    to run `sudo` in the default locale (with `LANG=`) so that the message
  #    stays consistent regardless of the user's locale.
  #
  ! LANG= sudo -n -v 2>&1 | grep -q "may not run sudo"
}

# The test -t 1 check only works when the function is not called from
# a subshell (like in `$(...)` or `(...)`, so this hack redefines the
# function at the top level to always return false when stdout is not
# a tty.
if test -t 1; then
  is_tty() {
    true
  }
else
  is_tty() {
    false
  }
fi

# This function uses the logic from supports-hyperlinks[1][2], which is
# made by Kat Marchán (@zkat) and licensed under the Apache License 2.0.
# [1] https://github.com/zkat/supports-hyperlinks
# [2] https://crates.io/crates/supports-hyperlinks
#
# Copyright (c) 2021 Kat Marchán
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
supports_hyperlinks() {
  # $FORCE_HYPERLINK must be set and be non-zero (this acts as a logic bypass)
  if test -n "$FORCE_HYPERLINK"; then
    [ "$FORCE_HYPERLINK" != 0 ]
    return $?
  fi

  # If stdout is not a tty, it doesn't support hyperlinks
  is_tty || return 1

  # DomTerm terminal emulator (domterm.org)
  if test -n "$DOMTERM"; then
    return 0
  fi

  # VTE-based terminals above v0.50 (Gnome Terminal, Guake, ROXTerm, etc)
  if test -n "$VTE_VERSION"; then
    [ $VTE_VERSION -ge 5000 ]
    return $?
  fi

  # If $TERM_PROGRAM is set, these terminals support hyperlinks
  case "$TERM_PROGRAM" in
  Hyper|iTerm.app|terminology|WezTerm) return 0 ;;
  esac

  # kitty supports hyperlinks
  if [ "$TERM" = xterm-kitty ]; then
    return 0
  fi

  # Windows Terminal also supports hyperlinks
  if test -n "$WT_SESSION"; then
    return 0
  fi

  # Konsole supports hyperlinks, but it's an opt-in setting that can't be detected
  # if test -n "$KONSOLE_VERSION"; then
  #   return 0
  # fi

  return 1
}

setup_color() {
  # Only use colors if connected to a terminal
  if ! is_tty; then
    BOLD=""
    RESET=""
    return
  fi

  BOLD=$(printf '\033[1m')
  RESET=$(printf '\033[m')
}

fmt_info() {
  printf >&2 '%s%s\n' "${0##*/}: " "$@"
}

fmt_link() {
  # $1: text, $2: url, $3: fallback mode
  if supports_hyperlinks; then
    printf '\033]8;;%s\033\\%s\033]8;;\033\\\n' "$2" "$1"
    return
  fi

  case "$3" in
  --text) printf '%s\n' "$1" ;;
  --url|*) fmt_underline "$2" ;;
  esac
}

fmt_underline() {
  is_tty && printf '\033[4m%s\033[24m\033[1m' "$*" || printf '%s\n' "$*"
}

install_blind() {
  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

  echo "Cloning Blind Bash (blind-bash)..."

  command_exists git || {
    fmt_info "git is not installed"
    echo "Please now installed first."
    exit 127
  }

  ostype=$(uname)
  if [ -z "${ostype%CYGWIN*}" ] && git --version | grep -Eq 'msysgit|windows'; then
    fmt_info "Windows/MSYS Git is not supported on Cygwin"
    fmt_info "Make sure the Cygwin git package is installed and is first on the \$PATH"
    exit 1
  fi

  # Manual clone with git config options to support git < v1.7.2
  git init --quiet "$BLIND" && cd "$BLIND" \
  && git config core.eol lf \
  && git config core.autocrlf false \
  && git config fsck.zeroPaddedFilemode ignore \
  && git config fetch.fsck.zeroPaddedFilemode ignore \
  && git config receive.fsck.zeroPaddedFilemode ignore \
  && git config blind-bash.remote origin \
  && git config blind-bash.branch "$BRANCH" \
  && git remote add origin "$REMOTE" \
  && git fetch --depth=1 origin \
  && git checkout -b "$BRANCH" "origin/$BRANCH" || {
    test ! -d "$BLIND" || {
      cd - >/dev/null 2>&1
      rm -rf "$BLIND" >/dev/null 2>&1 || rm -rf "$BLIND" >/dev/null 2>&1
    }
    fmt_info "git clone of blind-bash repo failed"
    exit 1
  }
  # Exit installation directory
  cd - >/dev/null 2>&1

  echo
}

setup_blind() {
  # Checking directory $PATH
  test -d "$PATH" && test -w "$PATH" && test -x "$PATH" || {
    PATH=/bin
    test -d "$PATH" && test -w "$PATH" && test -x "$PATH" || {
      fmt_info "no such directory \$PATH"
      exit 1
    }
  }

  # Checking file 'blind.sh'
  test -x "$BLIND/blind-bash.sh" || test -f "$BLIND/blind-bash.sh" || {
    chmod -x "$BLIND/blind-bash.sh"  >/dev/null 2>&1 || {
      fmt_info "cannot chmod file blind-bash.sh"
      echo "No such file blind-bash.sh in directory $BLIND"
      exit 1
    }
  }

  # Checking file 'upgrade.sh'
  test -x "$BLIND/tools/Linux/upgrade.sh" || test -f "$BLIND/tools/Linux/upgrade.sh" || {
    chmod -x "$BLIND/tools/Linux/upgrade.sh"  >/dev/null 2>&1 || {
      fmt_info "cannot chmod file upgrade.sh"
      echo "No such file upgrade.sh in directory $BLIND/tools/Linux"
      exit 1
    }
  }

  # Checking file 'uninstall.sh'
  test -x "$BLIND/tools/Linux/uninstall.sh" || test -f "$BLIND/tools/Linux/uninstall.sh" || {
    chmod -x "$BLIND/tools/Linux/uninstall.sh"  >/dev/null 2>&1 || {
      fmt_info "cannot chmod file uninstall.sh"
      echo "No such file uninstall.sh in directory $BLIND/tools/Linux"
      exit 1
    }
  }


  # Creating symbolic links
  echo "Create symbolic link..."

  ln -s "$BLIND/blind-bash.sh" "$PATH/blind-bash" >/dev/null 2>&1 || {
    fmt_info "cannot create symbolic link $BLIND/blind-bash.sh as $PATH/blind-bash"
    exit 1
  }
  ln -s "$BLIND/tools/Linux/upgrade.sh" "$PATH/bb-upgrade" >/dev/null 2>&1 || {
    fmt_info "cannot create symbolic link $BLIND/tools/Linux/upgrade.sh as $PATH/bb-upgrade"
    exit 1
  }
  ln -s "$BLIND/tools/Linux/uninstall.sh" "$PATH/bb-uninstall" >/dev/null 2>&1 || {
    fmt_info "cannot create symbolic link $BLIND/tools/Linux/uninstall.sh as $PATH/bb-uninstall"
    exit 1
  }

  fmt_info "create symbolic link success"
}

print_success() {
  printf '%s\n' "${BOLD}    __    ___           __      __               __"
  printf '%s\n' '   / /_  / (_)___  ____/ /     / /_  ____ ______/ /_'
  printf '%s\n' '  / __ \/ / / __ \/ __  /_____/ __ \/ __ `/ ___/ __ \'
  printf '%s\n' ' / /_/ / / / / / / /_/ /_____/ /_/ / /_/ (__  ) / / /'
  printf '%s\n' '/_.___/_/_/_/ /_/\__,_/     /_.___/\__,_/____/_/ /_/'
  printf '%s\n' '                       Has been installed!! :)'
  printf >&2 '%s\n' "Contact me in:"
  printf >&2 '%s\n' "• Facebook : $(fmt_link 파자르김 https://facebook.com/fajarrkim)"
  printf >&2 '%s\n' "• Instagram: $(fmt_link @fajarkim_ https://instagram.com/fajarkim_)"
  printf >&2 '%s\n' "             $(fmt_link @fajarhacker_ https://instagram.com/fajarhacker_)"
  printf >&2 '%s\n' "• Twitter  : $(fmt_link @fajarkim_ https://twitter.com/fajarkim_)"
  printf >&2 '%s\n' "• Telegram : $(fmt_link @FajarThea https://t.me/FajarThea)"
  printf >&2 '%s\n' "• WhatsApp : $(fmt_link +6285659850910 https://wa.me/6285659850910)"
  printf >&2 '%s\n' "• YouTube  : $(fmt_link 'Fajar Hacker' https://youtube.com/@FajarHacker)"
  printf >&2 '%s\n' "• E-mail   : fajarrkim@gmail.com${RESET}"
}

main() {
  setup_color

  # checking folder $BLIND
  if test -d "$BLIND"; then
    fmt_info "The folder '$BLIND' already exists."
    echo "You'll need to remove it if you want to reinstall."
    exit 1
  fi

  install_blind
  setup_blind
  print_success
}

main $@
