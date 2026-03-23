#!/usr/bin/env bash
 
set -e

USERNAME=${USERNAME:-dev}
if ! which zsh ; then
    echo "zsh not installed, skipping..."
    exit 1 
fi

if id $USERNAME &>/dev/null; then
    sudo usermod -aG wheel,docker $USERNAME
else
    sudo useradd -m -G wheel,docker $USERNAME
fi
chsh --shell /usr/bin/zsh $USERNAME

# OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
exit 0
