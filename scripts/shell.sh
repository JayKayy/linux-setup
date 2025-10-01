#!/usr/bin/env bash
 
set -e

USER=${USER:-dev}
if ! which zsh ; then
    echo "zsh not installed, skipping..."
    exit 1 
fi

useradd -m -G wheel,docker $USER 
chsh --shell /usr/bin/zsh $USER 

# OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
exit 0
