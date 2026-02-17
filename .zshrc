HISTFILE=~/.histfile
SAVEHIST=1000
bindkey -e
PROMPT=' %F{cyan}%~%f %F{magenta}→%f '

# Mise
eval "$(mise activate zsh)"

# matugen setting wallpaper
alias mg="$HOME/.config/matugen/mg.sh"

# Spicetify
export PATH=$PATH:/home/zor/.spicetify

# thefuck
eval $(thefuck --alias)

# peak auto complete
autoload -Uz compinit
compinit
