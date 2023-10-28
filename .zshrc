if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias zshconfig="code ~/.zshrc"
alias cl="clear"
alias ls="exa --icons"
alias mf="cd ~/Workspace/mf && exa --icons"
alias ms="cd ~/Workspace/ms && exa --icons"
alias dev="cd ~/Projects && exa --icons"

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
. "$HOME/.asdf/asdf.sh"

function getLibraryValues {
  readonly groupName=${1:?"Fornceça um valor válido para --group-name."}
  readonly project=${2:?"Fornceça um valor válido para --project."}
  az pipelines variable-group list --group-name ${groupName} --project ${project} | jq -r '.[].variables | keys[] as $k | "\($k) = \(.[$k] | .value)"'
}

function whosAtTheDoor {
  sudo lsof -i:"$1"
