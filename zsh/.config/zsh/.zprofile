[ -f "$ZDOTDIR/.zshenv" ]; source $ZDOTDIR/.zshenv

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && [ "$(hostname)" = "alyx" ]; then
  exec Hyprland
fi
