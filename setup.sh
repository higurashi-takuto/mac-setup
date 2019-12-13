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
sed -i '' s/'sorin'/'powerline'/ .zprezto/runcoms/zpreztorc

# git
curl -OL https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# .zsh
echo /usr/local/bin/zsh | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/.zshrc >| .zprezto/runcoms/zshrc
source .zshrc

# python
\mkdir Library/LaunchAgents
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/jupyterlab.plist > Library/LaunchAgents/jupyterlab.plist
NEWEST_PYTHON_VERSION=$(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1 | tr -d ' ')
env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install $NEWEST_PYTHON_VERSION
pyenv virtualenv $NEWEST_PYTHON_VERSION global
pyenv virtualenv $NEWEST_PYTHON_VERSION sublimetext
pyenv virtualenv $NEWEST_PYTHON_VERSION jupyterlab
pyenv global global
pip install --upgrade pip
pip install --upgrade setuptools
pyenv activate sublimetext
pip install --upgrade pip
pip install --upgrade setuptools
pip install flake8
pyenv deactivate
pyenv activate jupyterlab
pip install jupyterlab
jupyter notebook --generate-config
pyenv deactivate
sed -i '' s/'#c.NotebookApp.open_browser = True'/'c.NotebookApp.open_browser = False'/ .jupyter/jupyter_notebook_config.py
sed -i '' s/"#c.NotebookApp.notebook_dir = ''"/"c.NotebookApp.notebook_dir = '\/Users\/takuto\/'"/ .jupyter/jupyter_notebook_config.py
launchctl load ~/Library/LaunchAgents/jupyterlab.plist

# wallpaper
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/wallpaper/KaguyaLuna.png > Pictures/KaguyaLuna.png
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/wallpaper/HatsuneMiku.png > Pictures/HatsuneMiku.png
wallpaper set ~/Pictures/KaguyaLuna.png
