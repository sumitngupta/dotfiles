#!/usr/bin/env bash
# Install VS Code extensions. Run on a new machine after VS Code is installed.
extensions=(
  eamodio.gitlens                    # Git history, blame, etc.
  esbenp.prettier-vscode             # Code formatter
  PKief.material-icon-theme          # File icons
  ms-vscode-remote.remote-ssh        # Remote SSH — open Baymax filesystem in VS Code
)

for ext in "${extensions[@]}"; do
  code --install-extension "$ext"
done
