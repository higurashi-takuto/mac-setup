# prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

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
alias pyhttp=pyhttpl
alias freeze="pip freeze > requirements.txt"
alias ni="npm install"
alias ns="npm run start"
alias nb="npm run build"
alias nw="npm run watch"
alias nd="npm run dev"

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
function ignore(){
    if [ -e .gitignore ]; then
        curl -L "https://raw.githubusercontent.com/github/gitignore/master/${@}.gitignore" >> .gitignore
    else
        curl -L "https://raw.githubusercontent.com/github/gitignore/master/${@}.gitignore" > .gitignore
    fi
}
function pyhttpl(){
    if [ "$@" ]; then
        python -m http.server --bind 127.0.0.1 "$@"
    else
        python -m http.server --bind 127.0.0.1 8000
    fi
}
function pyhttpg(){
    if [ "$@" ]; then
        python -m http.server --bind 0.0.0.0 "$@"
    else
        python -m http.server --bind 0.0.0.0 8000
    fi
}
