#!/bin/bash

set -xe pipefail

##########
# Repos
##########

repos=$(ls ./repos/)
cp ./repos/*.repo /etc/yum.repos.d/
for repo in $repos; do
    echo "Adding repo $repo"
    sudo dnf config-manager addrepo --overwrite --from-repofile=/etc/yum.repos.d/$repo
done

# rpm fusion free and non-free repos
fedora=$(rpm -E %fedora)
dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${fedora}.noarch.rpm https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-${fedora}.noarch.rpm

##########
# Packages
##########


dnf -y upgrade

packages=(
    git
    ffmpeg-free
    tmux
    neovim
    curl
    zsh
    podman
    buildah
    docker
    discord
    steam
    flatpak
)
# turn above array into a string e.g. "a b c..."
pkgstr=$( IFS=$' '; echo "${packages[*]}" )

# dry run for tests
#dnf install --assumeno $pkgstr ||:
dnf install -y $pkgstr

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y --noninteractive flathub org.signal.Signal io.mgba.mGBA



