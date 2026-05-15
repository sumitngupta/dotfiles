# dotfiles

Mac setup managed via Claude Code sessions.

## Bootstrap a new machine

```bash
# 1. Install Homebrew (if not present)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Clone this repo
git clone https://github.com/sumitngupta/dotfiles ~/dotfiles

# 3. Run setup
bash ~/dotfiles/setup.sh

# 4. Apply macOS preferences (log out after to take effect)
bash ~/dotfiles/macos.sh
```

## Structure

| File/Dir | Purpose |
|---|---|
| `Brewfile` | All apps and CLI tools (run `brew bundle`) |
| `setup.sh` | Full bootstrap script for a new machine |
| `macos.sh` | macOS system preferences (scroll direction, etc.) |
