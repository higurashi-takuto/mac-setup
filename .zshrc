if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

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

function cd(){
    builtin cd "$@" && ls
}
function mkcd(){
    \mkdir "$@" && builtin cd "$@"
}
function pyzsh(){
    if [ $# = 0 ]; then
        docker run -v /Users/takuto/:/takuto --rm -it pyzsh /usr/bin/zsh
    elif [ $# = 1 ]; then
        docker run -v /Users/takuto/:/takuto --name $1 -it pyzsh /usr/bin/zsh
    else
        echo 引数の数が正しくありません。
    fi
}
function dircon(){
    docker start -i $(basename $(pwd))
}
