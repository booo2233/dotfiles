# PATH
export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
[[ -d "$PYENV_ROOT/versions/3.13t-dev/bin" ]] && export PATH="$PYENV_ROOT/versions/3.13t-dev/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# FZF
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# Aliases
alias vim=nvim
alias ls=lsd
alias cat="bat --paging=always --pager='less -R'"
alias code=codium

alias fbc='codium $(fzf -m --preview="bat --color=always {}")'
alias fbv='/bin/nvim $(fzf -m --preview="bat --color=always {}")' 
# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS

# Completions
fpath=("$HOME/zsh-completions/src" $fpath)
fpath+=("$HOME/.zfunc")

autoload -Uz compinit
compinit

# Pyenv
eval "$(pyenv init -)"

# Plugins / sourcing
source "$HOME/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# FZF key bindings / completion
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Optional bash completion support
autoload -Uz bashcompinit
bashcompinit

# Key bindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Prompt
eval "$(starship init zsh)"

# Fastfetch
command -v fastfetch >/dev/null && fastfetch
