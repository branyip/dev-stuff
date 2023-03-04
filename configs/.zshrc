# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="dracula"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
fpath+=/usr/local/share/zsh/site-functions
autoload -U promptinit; promptinit
prompt pure


# aliases
alias zp="atom ~/.zshrc"
alias zs="source ~/.zshrc"
alias src="cd ~/src"


# exports
export DOCKER_DEFAULT_PLATFORM=linux/amd64  # remove if not on an M1 machine
export PYENV_ROOT="$HOME/.pyenv"


# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
autoload -U add-zsh-hook  # this should go after nvm is loaded


# Pyenv
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
