#!/bin/bash

# install pacman packages
sudo pacman -S --no-confirm bash-language-server curl firefox flatpak ghostty git helix shellcheck shfmt spotify taplo ttf-jetbrains-mono-nerd wget

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
# source new envs
source ~/.bashrc
# install latest node version
nvm install node
# install lsps with npm
npm install -g prettier typescript typescript-language-server vscode-langservers-extracted
