# Enhanced bash completion settings
bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'
bind 'set completion-ignore-case on'
bind 'set menu-complete-display-prefix on'
bind 'set colored-completion-prefix on'
bind 'set colored-stats on'
bind 'TAB:menu-complete'

# FZF configuration
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# aliases
alias wall="tcc -run ~/.change_wall.c"
alias ls="exa -hg --icons --group-directories-first  "
alias la="exa -hg --icons --group-directories-first -A"
alias ll="exa -hg --icons --group-directories-first -l"
alias lla="exa -hg --icons --group-directories-first -l -A"
alias g="git"
alias a="clear && tcc -run main.c"
alias spotify="dbus-run-session spotify"
alias r="cargo build && clear && cargo run"
alias rust="rustc main.rs && ./main"
alias i="doas pacman -S"
alias s="doas pacman -Ss"
alias d="doas pacman -Rns"
alias u="doas pacman -Syu"

# Prompt
BLUE="\e[34m"
GREEN="\e[32m"
RESET="\e[0m"
PS1="${BLUE} \w${GREEN}  ${RESET}"
