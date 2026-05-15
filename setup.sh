#!/usr/bin/env bash
# setup.sh — bootstrap a new Mac from this dotfiles repo
# Usage: bash setup.sh
set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Checking for Homebrew..."
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "==> Installing packages from Brewfile..."
brew bundle --file="$DOTFILES/Brewfile"

echo "==> Symlinking dotfiles..."
ln -sf "$DOTFILES/gitconfig" ~/.gitconfig
ln -sf "$DOTFILES/zshrc" ~/.zshrc
ln -sf "$DOTFILES/aliases" ~/.aliases

echo "==> Symlinking VS Code settings..."
mkdir -p ~/Library/Application\ Support/Code/User
ln -sf "$DOTFILES/vscode/settings.json" ~/Library/Application\ Support/Code/User/settings.json
bash "$DOTFILES/vscode/extensions.sh"

echo "==> Done. Next: run bash macos.sh, then open a new terminal."
