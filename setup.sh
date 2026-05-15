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

echo "==> Done. Open a new terminal to pick up any shell changes."
