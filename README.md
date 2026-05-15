# dotfiles

Mac setup managed via Claude Code sessions.

## Bootstrap a new machine

```bash
# 1. Install Homebrew (if not present)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Clone this repo
git clone <your-repo-url> ~/dotfiles

# 3. Run setup
bash ~/dotfiles/setup.sh
```

## Structure

| File/Dir | Purpose |
|---|---|
| `Brewfile` | All apps and CLI tools (run `brew bundle`) |
| `setup.sh` | Full bootstrap script for a new machine |
