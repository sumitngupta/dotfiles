#!/usr/bin/env bash
# macos.sh — macOS system preferences
# Run after setup.sh on a new machine. Some changes require logout to take effect.
set -e

echo "==> Applying macOS preferences..."

# Dark mode
osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'

# Trackpad: traditional scroll direction (not natural/reversed)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Default browser: set Brave via its welcome screen on first launch —
# the defaultbrowser CLI only works after Brave has self-registered.

echo "==> Done. Log out and back in for all changes to take effect."
