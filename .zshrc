# prezto
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
alias dsstore="sudo find . -name '*.DS_Store' -type f -ls -delete"
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
alias pylo="pyenv local"
alias pyac="pyenv activate"
alias pyde="pyenv deactivate"
alias pyun="pyenv shell --unset"

# function
function cd(){
    builtin cd "$@" && ls
}
function mkcd(){
    \mkdir "$@" && builtin cd "$@"
}
function mkpyenv(){
    PYTHONVERSION=$(pyenv versions | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1 | tr -d ' ')
    pyenv virtualenv $PYTHONVERSION "$@"
    pyenv activate "$@"
    pip install --upgrade pip
    pip install --upgrade setuptools
    pyenv deactivate
}
