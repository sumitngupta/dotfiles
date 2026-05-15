#!/usr/bin/env bash
# macos.sh — macOS system preferences
# Run after setup.sh on a new machine. Some changes require logout to take effect.
set -e

echo "==> Applying macOS preferences..."

# Trackpad: traditional scroll direction (not natural/reversed)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo "==> Done. Log out and back in for all changes to take effect."
