# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="dracula"
plugins=(zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# zsh completion system
autoload -Uz compinit
compinit

# pure prompt init
autoload -U promptinit; promptinit
prompt pure

# aliases
alias zp="zed ~/.zshrc"
alias zs="source ~/.zshrc"
alias src="cd ~/src"
alias ipython="uv run --with ipython ipython"

# exports
export DOCKER_DEFAULT_PLATFORM=linux/amd64  # remove if not on an M1 machine

# Allow fnm to automatically change node versions
eval "$(fnm env --use-on-cd --shell zsh)"
