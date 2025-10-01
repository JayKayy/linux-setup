#!/usr/bin/env bash

set -e 

##################
# Repos
##################

repos=$(ls ./repos/)
for repo in "$repos"; do
    echo "Adding repo $repo"
    cp ./repos/"$repo" /etc/yum.repos.d/
    sudo dnf config-manager addrepo --overwrite --from-repofile=/etc/yum.repos.d/$repo
done

#Problem: cannot install the best candidate for the job
#  - package ffmpeg-libs-7.1.2-1.fc42.x86_64 from rpmfusion-free-updates conflicts with libavcodec-free provided by libavcodec-free-7.1.1-4.fc42.x86_64 from updates
#  - package libavcodec-freeworld-7.1.2-1.fc42.x86_64 from rpmfusion-free-updates conflicts with libavcodec-free < 7.1.2 provided by libavcodec-free-7.1.1-4.fc42.x86_64 from updates
#  - package ffmpeg-free-7.1.1-4.fc42.x86_64 from updates requires libavcodec-free(x86-64) = 7.1.1-4.fc42, but none of the providers can be installed
#You can try to add to command line:
#  --skip-unavailable to skip unavailable packages

# RPM Fusion
fedora=$(rpm -E %fedora)
dnf install -y \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${fedora}.noarch.rpm \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-${fedora}.noarch.rpm

##################
# Packages
##################

packages=(
    @cosmic-desktop-environment
    brave-browser
    buildah
    cargo
    cockpit
    curl
    discord
    docker
    ffmpeg
    flatpak
    fuzzel
    fzf
    gcc
    git
    golang
    lua
    make
    ncurses
    neovim
    nodejs
    openssl-devel
    parallel
    podman
    ripgrep
    sqlite-devel
    steam
    stow
    tmux
    wireguard
    wireguard-tools
    zoxide
    zsh
    zsh-syntax-highlighting
)

# turn above array into a string e.g. "a b c..."
pkgstr=$( IFS=$' '; echo "${packages[*]}" )
dnf upgrade -y
dnf install -y --allowerasing $pkgstr

##########
# Flatpak
##########

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y --noninteractive flathub org.signal.Signal io.mgba.mGBA

