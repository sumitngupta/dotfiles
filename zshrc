# ~/.zshrc

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# User-local binaries
export PATH="$HOME/.local/bin:$PATH"

# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# zsh plugins (installed via Homebrew, sourced directly)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship prompt
eval "$(starship init zsh)"
