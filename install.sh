#!/usr/bin/env sh

# This is free and unencumbered software released into the public domain.

set -e -u

# Command-line options
prefix="${HOME:-${PWD:?}}"
while getopts p: opt; do
    case "${opt}" in
        p) prefix="${OPTARG:?}";;
        *) exit 1;;
    esac
done

# Paths can't be empty
: ${prefix:?}

# Create subdirectories that shouldn't be owned by stow
(
    set -e -u
    umask go=
    mkdir -p -- \
        "${prefix}/.config" \
        "${prefix}/.gnupg" \
        "${prefix}/.local/bin" \
        "${prefix}/.ssh"
)

# Install symlinks and fix file permissions
stow --adopt "--target=${prefix}" src
chmod -R -- go= \
    "${prefix}/.config" \
    "${prefix}/.gnupg" \
    "${prefix}/.local/bin" \
    "${prefix}/.ssh"
