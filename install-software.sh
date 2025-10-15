#!/bin/bash

# install pacman packages
sudo pacman -Syu --noconfirm bash-language-server curl docker docker-compose firefox flatpak ghostty git github-cli helix shellcheck shfmt spotify-launcher tombi ttf-jetbrains-mono-nerd wget

# set default browser
xdg-settings set default-web-browser firefox.desktop

# generate ssh-key
ssh-keygen -t ed25519

# Prompt for name
read -p "Enter your Git user name: " git_name
# Prompt for email
read -p "Enter your Git email address: " git_email

# Apply git configuration
git config --global user.name "$git_name"
git config --global user.email "$git_email"

# login to github
gh auth login

# start/enable docker
sudo systemctl enable --now docker.service
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# install flatpak packages
flatpak install -y discord obs

# Rust toolchain setup
# install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# source new envs
source ~/.cargo/env
# add clippy and rust-analyzer
rustup component add clippy rust-analyzer
# add wasm target
rustup target add wasm32-unknown-unknown

# Node.js setup
# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
# load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# install latest node version
nvm install node
# install lsps with npm
npm install -g prettier typescript typescript-language-server vscode-langservers-extracted
