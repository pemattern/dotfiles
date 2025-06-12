#!/bin/bash

# Rust toolchain setup
# install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# source new envs
source ~/.cargo/env
# add rust-analyzer
rustup component add rust-analyzer
# add wasm target
rustup target add wasm32-unknown-unknown

# Node.js setup
# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
# source new envs
source ~/.bashrc
# install latest node version
nvm install node
