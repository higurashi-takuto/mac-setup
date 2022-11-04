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

# asdf
curl -OL https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/resources/.asdfrc
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs lts
asdf global nodejs lts
