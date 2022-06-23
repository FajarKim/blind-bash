#!/data/data/com.termux/files/usr/bin/bash
set -e

# Default settings
SHAREDIR=${SHAREDIR:-`command -v bash | sed 's|/bin/bash||'`/share}
BLINDBASH=${BLINDBASH:-$SHAREDIR/blind-bash}

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
    FMT_UNDERLINE=""
    return
  fi

  FMT_RED=$(printf '\033[31m')
  FMT_GREEN=$(printf '\033[32m')
  FMT_YELLOW=$(printf '\033[33m')
  FMT_BLUE=$(printf '\033[34m')
  FMT_CYAN=$(printf '\033[36m')
  FMT_BOLD=$(printf '\033[1m')
  FMT_RESET=$(printf '\033[0m')
  FMT_UNDERLINE=$(printf '\033[4m')
}

update_blindbash () {
  command_exists git || {
    fmt_error "git is not installed"
    exit 1
  }

  echo "${FMT_BOLD}${FMT_BLUE}Updating Blind Bash...${FMT_RESET}"

  if ! command git --git-dir="$BLINDBASH/.git" --work-tree="$BLINDBASH" pull --rebase --stat origin master; then
    # In case it enters the rebasing mode
    fmt_error "running 'git rebase --abort'..."
    command git --git-dir="$BLINDBASH/.git" --work-tree="$BLINDBASH" rebase --abort
    printf "${FMT_BOLD}${FMT_RED}%s${FMT_RESET}\n" \
           'There was an error updating.' \
           "If you have uncommited changes in '$FMT_UNDERLINE$BLINDBASH$FMT_RESET$FMT_RED', please commit, stash or discard them and retry updating." \
           "If you have your own local commits in '$FMT_UNDERLINE$BLINDBASH$FMT_RESET$FMT_RED' that conflict with the upstream changes, please resolve conflicts and merge the upstream manually."
    return 1
  fi
}

print_success () {
  printf '%s%s    __    ___           __      __               __%s\n' $FMT_BOLD $FMT_BLUE $FMT_RESET
  printf '%s%s   / /_  / (_)___  ____/ /     / /_  ____ ______/ /_%s\n' $FMT_BOLD $FMT_BLUE $FMT_RESET
  printf '%s%s  / __ \\/ / / __ \\/ __  /_____/ __ \\/ __ `/ ___/ __ \\%s\n' $FMT_BOLD $FMT_BLUE $FMT_RESET
  printf '%s%s / /_/ / / / / / / /_/ /_____/ /_/ / /_/ (__  ) / / /%s\n' $FMT_BOLD $FMT_BLUE $FMT_RESET
  printf '%s%s/_.___/_/_/_/ /_/\\__,_/     /_.___/\\__,_/____/_/ /_/%s\n' $FMT_BOLD $FMT_BLUE $FMT_RESET
  printf '%s%s–––––––––––––––––––––––––––––––––––––––––––––––––––––%s\n' $FMT_BOLD $FMT_CYAN $FMT_RESET
  printf '%s\n' "${FMT_BOLD}${FMT_WHITE}Horray, Blind Bash is now updated!${FMT_RESET}"
  printf '%s\n' "${FMT_BOLD}${FMT_WHITE}To keep up on the latest news and updates, follow us on GitHub: ${FMT_UNDERLINE}https://github.com/TeamThea/blind-bash${FMT_RESET}"
  exit 0
}

main () {
  setup_color
  update_blindbash
  print_success
}

main "$@"
