#!/bin/zsh

# Hidden folder
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

# Homebrew
if [ ! -e .Brewfile ]; then
  curl -OL https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/resources/.Brewfile
fi
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/bundle
brew bundle --global

# prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
sed -i '' s/'sorin'/'agnoster'/ .zprezto/runcoms/zpreztorc

# git
curl -OL https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/resources/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# .zsh
echo /usr/local/bin/zsh | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/resources/.zshrc > .zprezto/runcoms/zshrc
source .zshrc

# python
NEWEST_PYTHON_VERSION=$(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1 | tr -d ' ')
env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install $NEWEST_PYTHON_VERSION
pyenv virtualenv $NEWEST_PYTHON_VERSION global
pyenv global global
pip install --upgrade pip
pip install --upgrade setuptools

# ruby
NEWEST_RUBY_VERSION=$(rbenv install -l | grep -v '[a-zA-Z]' | tail -1)
rbenv install $NEWEST_RUBY_VERSION
rbenv global $NEWEST_RUBY_VERSION

# node
NEWEST_NODE16_VERSION=$(nodenv install -l | grep -v '[a-zA-Z]' | grep -e '^16\.?*' | tail -1 | tr -d ' ')
nodenv install $NEWEST_NODE16_VERSION
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/resources/.vuerc > .vuerc

# tmux
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/resources/.tmux.conf > .tmux.conf
