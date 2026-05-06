#!/bin/bash

# Set install mode to online since boot.sh is used for curl installations
export ARCHBRIGADE_ONLINE_INSTALL=true

ansi_art='
  ████  ██████   ██████ ██   ██
 ██  ██ ██   ██ ██      ██   ██
 ██████ ██████  ██      ███████
 ██  ██ ██  ██  ██      ██   ██
 ██  ██ ██   ██  ██████ ██   ██

 ██████  ██████  ██  ██████   ██████  ██████  ███████
 ██   ██ ██   ██ ██ ██       ██    ██ ██   ██ ██
 ██████  ██████  ██ ██   ███ ███████  ██   ██ █████
 ██   ██ ██  ██  ██ ██    ██ ██   ██  ██   ██ ██
 ██████  ██   ██ ██  ██████  ██   ██  ██████  ███████ '

clear
echo -e "\n$ansi_art\n"

sudo pacman -Syu --noconfirm --needed git

# Use custom repo if specified, otherwise default to vmnavarro94/archbrigade
ARCHBRIGADE_REPO="${ARCHBRIGADE_REPO:-vmnavarro94/archbrigade}"

echo -e "\nCloning ArchBrigade from: https://github.com/${ARCHBRIGADE_REPO}.git"
rm -rf ~/.local/share/archbrigade/
git clone "https://github.com/${ARCHBRIGADE_REPO}.git" ~/.local/share/archbrigade >/dev/null

# Use custom branch if instructed, otherwise default to master
ARCHBRIGADE_REF="${ARCHBRIGADE_REF:-master}"
if [[ $ARCHBRIGADE_REF != "master" ]]; then
  echo -e "\e[32mUsing branch: $ARCHBRIGADE_REF\e[0m"
  cd ~/.local/share/archbrigade
  git fetch origin "${ARCHBRIGADE_REF}" && git checkout "${ARCHBRIGADE_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/archbrigade/install.sh
