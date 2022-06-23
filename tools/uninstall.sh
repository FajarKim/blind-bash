#!/data/data/com.termux/files/usr/bin/bash
#
# Default settings
SHAREDIR=${SHAREDIR:-`command -v bash | sed 's|/bin/bash||'`/share}
BLINDBASH=${BLINDBASH:-$SHAREDIR/blind-bash}

command_exists () {
  command -v "$@" || return 1
}

rm -rf `command_exists blind-bash bb-update bb-uninstall`
rm -rf "$BLINDBASH"

printf "\033[1;37mBlind Bash has been uninstalled.\nThank you for using this tools.\033[0m\n"
exit
