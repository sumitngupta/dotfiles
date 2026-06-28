#!/usr/bin/env bash
# macos.sh — macOS system preferences
# Run after setup.sh on a new machine. Some changes require logout to take effect.
set -e

echo "==> Applying macOS preferences..."

write_disabled_symbolic_hotkey() {
  local hotkey_id="$1"
  local char_code="$2"
  local key_code="$3"
  local modifier_flags="$4"

  defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add "$hotkey_id" \
    "{ enabled = 0; value = { parameters = ($char_code, $key_code, $modifier_flags); type = standard; }; }"
}

# Dark mode
osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'

# Trackpad: traditional scroll direction (not natural/reversed)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Default browser: set Brave via its welcome screen on first launch —
# the defaultbrowser CLI only works after Brave has self-registered.

# Dock: auto-hide, magnification ~20% above base size
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock largesize -int 58
killall Dock

# Raycast: use as the Spotlight replacement on Cmd-Space.
# Hotkey IDs 64/65 are Spotlight; 60/61 are Input Sources shortcuts.
write_disabled_symbolic_hotkey 60 32 49 262144
write_disabled_symbolic_hotkey 61 32 49 786432
write_disabled_symbolic_hotkey 64 32 49 1048576
write_disabled_symbolic_hotkey 65 32 49 1179648
defaults write com.raycast.macos raycastGlobalHotkey -string "Command-49"
defaults write com.raycast.macos startupEnabled -bool true
if [ -d "/Applications/Raycast.app" ]; then
  open -a Raycast
fi
echo "    If Raycast has a delay on Cmd-Space, disable Siri's hold-Cmd-Space shortcut manually."

# Night Shift: sunset to sunrise schedule, enabled
nightlight schedule start && nightlight on

echo "==> Done. Log out and back in for all changes to take effect."
