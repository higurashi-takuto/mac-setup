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
alias pyhttp="python -m http.server 8000"
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
fubction ignore(){
    if [ -e .gitignore ]; then
        curl -L "https://raw.githubusercontent.com/github/gitignore/master/${@}.gitignore" >> .gitignore
    else
        curl -L "https://raw.githubusercontent.com/github/gitignore/master/${@}.gitignore" > .gitignore
    fi
}
