#!/bin/bash

# OhMyZsh
dnf install -y zsh git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
exit 0

