# This is free and unencumbered software released into the public domain.

# Read other zsh config files from an XDG-style config directory
ZDOTDIR=~/.config/zsh

# Update locale from systemd-localed service configuration
if [[ -f ~/.config/locale.conf ]]; then
    . ~/.config/locale.conf
    if [[ -n ${LANG:-} ]]; then export LANG; fi
    if [[ -n ${LC_COLLATE:-} ]]; then export LC_COLLATE; fi
fi

umask 022
