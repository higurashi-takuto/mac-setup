#!/bin/zsh

# Hidden folder
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

# Homebrew
curl -OL https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/.Brewfile
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/bundle
brew bundle --global

# prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# git
curl -OL https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# .zsh
echo /usr/local/bin/zsh | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
curl -OL https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/.zshrc
source .zshrc

# python
env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install $(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1)
pyenv virtualenv $(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1) global
pyenv global global
pip install --upgrade pip
pip install flake8
