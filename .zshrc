
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"


# alias
alias pyhttp="python -m http.server 8000"
alias phphttp="php -S 0.0.0.0:8000"

alias dsstore="sudo find . -name '*.DS_Store' -type f -ls -delete"
alias freeze="pip freeze > requirements.txt"

alias vi="subl"
alias vim="subl"
alias emacs="subl"
alias atom="subl"
alias code="subl"

alias ..="cd .."
alias ...="cd ../.."
alias ls="ls -a"
alias ll="ls -l"
alias mkdir=mkcd


# func
function cd(){
    builtin cd "$@" && ls
}
function mkcd(){
    \mkdir "$@" && builtin cd "$@"
}
function makesetup(){
    py2applet --make-setup $1
}
function makeapp(){
    py2applet --make-setup $1
    python setup.py py2app
}
function texpdf(){
    platex $1.tex
    platex $1.tex
    dvipdfmx $1.dvi
}
function profile(){
    echo -e "\033]1337;SetProfile=$1\a"
}
