#!/bin/zsh

# Hidden folder
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

# Homebrew
if [ ! -e .Brewfile ]; then
  curl -OL https://raw.githubusercontent.com/higurashi-takuto/mac-setup/main/resources/.Brewfile
fi
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
curl -OL https://raw.githubusercontent.com/higurashi-takuto/mac-setup/main/resources/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# .zsh
echo /opt/homebrew/bin/zsh | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/zsh
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/main/resources/.zshrc > .zprezto/runcoms/zshrc
source .zshrc

# asdf
curl -OL https://raw.githubusercontent.com/higurashi-takuto/mac-setup/main/resources/.asdfrc
asdf plugin-add direnv
asdf direnv setup --shell zsh --version latest
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs lts
asdf global nodejs lts

# 設定ファイルダウンロード
curl -OL https://raw.githubusercontent.com/higurashi-takuto/mac-setup/main/resources/.tmux.conf
curl -OL https://raw.githubusercontent.com/higurashi-takuto/mac-setup/main/resources/iTerm2.json
