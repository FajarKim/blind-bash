#!/data/data/com.termux/files/usr/bin/bash
# This tools for installing blind-bash  in Termux App
#
set -e

# Default Settings
REPO=${REPO:-TeamThea/blind-bash}
PATH=${PATH:-`command -v bash | sed 's|/bash||'`}
SHAREDIR=${SHAREDIR:-`command -v bash | sed 's|/bin/bash||'`/share}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}
BLINDBASH=${BLINDBASH:-$SHAREDIR/blind-bash}

if [ ! -d "$PATH" ]; then
  mkdir "$PATH"
fi

if [ ! -d "$SHAREDIR" ]; then
  mkdir "$SHAREDIR"
fi

command_exists () {
  command -v "$@" >/dev/null 2>&1
}

# The [ -t 1 ] check only works when the function is not called from
# a subshell (like in `$(...)` or `(...)`, so this hack redefines the
# function at the top level to always return false when stdout is not
# a tty.
if [ -t 1 ]; then
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
supports_hyperlinks () {
  # $FORCE_HYPERLINK must be set and be non-zero (this acts as a logic bypass)
  if [ -n "$FORCE_HYPERLINK" ]; then
    [ "$FORCE_HYPERLINK" != 0 ]
    return $?
  fi

  # If stdout is not a tty, it doesn't support hyperlinks
  is_tty || return 1

  # DomTerm terminal emulator (domterm.org)
  if [ -n "$DOMTERM" ]; then
    return 0
  fi

  # VTE-based terminals above v0.50 (Gnome Terminal, Guake, ROXTerm, etc)
  if [ -n "$VTE_VERSION" ]; then
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

  # Windows Terminal or Konsole also support hyperlinks
  if [ -n "$WT_SESSION" ] || [ -n "$KONSOLE_VERSION" ]; then
    return 0
  fi

  return 1
}

# Adapted from code and information by Anton Kochkov (@XVilka)
# Source: https://gist.github.com/XVilka/8346728
supports_truecolor () {
  case "$COLORTERM" in
  truecolor|24bit) return 0 ;;
  esac

  case "$TERM" in
  iterm           |\
  tmux-truecolor  |\
  linux-truecolor |\
  xterm-truecolor |\
  screen-truecolor) return 0 ;;
  esac

  return 1
}

fmt_link () {
  # $1: text, $2: url, $3: fallback mode
  if supports_hyperlinks; then
    printf '\033]8;;%s\a%s\033]8;;\a\n' "$2" "$1"
    return
  fi

  case "$3" in
  --text) printf '%s\n' "$1" ;;
  --url|*) fmt_underline "$2" ;;
  esac
}

fmt_underline () {
  is_tty && printf '\033[4m%s\033[24m\n' "$*" || printf '%s\n' "$*"
}

# shellcheck disable=SC2016 # backtick in single-quote
fmt_code () {
  is_tty && printf '`\033[2m%s\033[22m`\n' "$*" || printf '`%s`\n' "$*"
}

fmt_error () {
  printf '%sError: %s%s\n' "${FMT_BOLD}${FMT_RED}" "$*" "$FMT_RESET" >&2
}

setup_color () {
  # Only use colors if connected to a terminal
  if ! is_tty; then
    FMT_RAINBOW=""
    FMT_RED=""
    FMT_GREEN=""
    FMT_YELLOW=""
    FMT_BLUE=""
    FMT_CYAN=""
    FMT_BOLD=""
    FMT_RESET=""
    return
  fi

  FMT_RED=$(printf '\033[31m')
  FMT_GREEN=$(printf '\033[32m')
  FMT_YELLOW=$(printf '\033[33m')
  FMT_BLUE=$(printf '\033[34m')
  FMT_CYAN=$(printf '\033[36m')
  FMT_BOLD=$(printf '\033[1m')
  FMT_RESET=$(printf '\033[0m')
}

setup_blindbash () {
  umask g-w,o-w

  echo "${FMT_BLUE}Cloning Blind Bash...${FMT_RESET}"

  command_exists git || {
    fmt_error "git is not installed"
    exit 1
  }

  # Manual clone with git config options to support git < v1.7.2
  git init --quiet "$BLINDBASH" && cd "$BLINDBASH" \
  && git config core.eol lf \
  && git config core.autocrlf false \
  && git config fsck.zeroPaddedFilemode ignore \
  && git config fetch.fsck.zeroPaddedFilemode ignore \
  && git config receive.fsck.zeroPaddedFilemode ignore \
  && git config oh-my-zsh.remote origin \
  && git config oh-my-zsh.branch "$BRANCH" \
  && git remote add origin "$REMOTE" \
  && git fetch --depth=1 origin \
  && git checkout -b "$BRANCH" "origin/$BRANCH" || {
    [ ! -d "$BLINDBASH" ] || {
      cd -
      rm -rf "$BLINDBASH" 2>/dev/null
    }
    fmt_error "git clone of blind-bash repo failed"
    exit 1
  }
  # Exit installation directory
  cd -

  echo
}

create_symboliclink () {
  skip=50

  case $(printf 'X\n' | tail -n +1 2>/dev/null) in
  X) tail_n=-n;;
  *) tail_n=;;
  esac

  echo "${FMT_BOLD}${FMT_BLUE}Create symbolic link...${FMT_RESET}"

  if [ -r "$BLINDBASH"/blind-bash.sh && -r "$BLINDBASH"/tools/update.sh && -r "$BLINDBASH"/tools/uninstall.sh ]; then
    # Create symbolic link blind-bash.sh
    if tail $tail_n +$skip <"${BLINDBASH}/blind-bash.sh" | ln -s "$BLINDBASH"/blind-bash.sh "$PATH"/blind-bash >/dev/null 2>&1; then
      if [ ! -x "$PATH"/blind-bash ]; then
        chmod +x "$PATH"/blind-bash
      fi
    else
      fmt_error "failed create symbolic link"
      exit 1
    fi

    # Create symbolic link update.sh
    if tail $tail_n +$skip <"${BLINDBASH}/tools/update.sh" | ln -s "$BLINDBASH"/tools/update.sh "$PATH"/bb-update >/dev/null 2>&1; then
      if [ ! -x "$PATH"/bb-update ]; then
        chmod +x "$PATH"/bb-update
      fi
    else
      fmt_error "failed create symbolic link"
      exit 1
    fi

    # Create symbolic link uninstall.sh
    if tail $tail_n +$skip <"${BLINDBASH}/tools/uninstall.sh" | ln -s "$BLINDBASH"/tools/uninstall.sh "$PATH"/bb-uninstall >/dev/null 2>&1; then
      if [ ! -x "$PATH"/bb-uninstall ]; then
        chmod +x "$PATH"/bb-uninstall
      fi
    else
      fmt_error "failed create symbolic link"
      exit 1
    fi

  else
    fmt_error "Cannot files 'blind-bash.sh', 'update.sh', and/or 'uninstall.sh' in $BLINDBASH"
    exit 1
  fi

  echo
}

print_success () {
  printf '%s%s    __    ___           __      __               __%s\n' $FMT_BOLD $FMT_BLUE $FMT_RESET
  printf '%s%s   / /_  / (_)___  ____/ /     / /_  ____ ______/ /_%s\n' $FMT_BOLD $FMT_BLUE $FMT_RESET
  printf '%s%s  / __ \\/ / / __ \\/ __  /_____/ __ \\/ __ `/ ___/ __ \\%s\n' $FMT_BOLD $FMT_BLUE $FMT_RESET
  printf '%s%s / /_/ / / / / / / /_/ /_____/ /_/ / /_/ (__  ) / / /%s\n' $FMT_BOLD $FMT_BLUE $FMT_RESET
  printf '%s%s/_.___/_/_/_/ /_/\\__,_/     /_.___/\\__,_/____/_/ /_/%s\n' $FMT_BOLD $FMT_BLUE $FMT_RESET
  printf '%s%s–––––––––––––––––––––––––––––––––––––––––––––––––––––%s\n' $FMT_BOLD $FMT_CYAN $FMT_RESET
  printf '%s\n' "${FMT_BOLD}${FMT_WHITE}Horray, Blind Bash is now installed!${FMT_RESET}"
  exit 0
}

main () {
  setup_color
  case $HOME in
  */com.termux/*) ;;
  *) fmt_error "this tools working in Termux App"; exit 1;;
  esac
  setup_blindbash
  create_symboliclink
  print_success
}

main "$@"
