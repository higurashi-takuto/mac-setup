# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# direnv
eval "$(direnv hook zsh)"

# alias
alias dsstore="sudo find . -name '*.DS_Store' -type f -ls -delete"
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls -a"
alias ll="ls -l"
alias mkdir=mkcd

# function
function cd(){
    builtin cd "$@" && ls
}
function mkcd(){
    \mkdir "$@" && builtin cd "$@"
}
