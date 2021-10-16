ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
ln -s /Applications/Sublime\ Merge.app/Contents/SharedSupport/bin/smerge /usr/local/bin/smerge

curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/sublime/Adaptive.sublime-theme > ~/Library/Application\ Support/Sublime\ Text/Packages/User/Adaptive.sublime-theme
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/sublime/Monokai.sublime-color-scheme > ~/Library/Application\ Support/Sublime\ Text/Packages/User/Monokai.sublime-color-scheme
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/sublime/OmniMarkupPreviewer.sublime-settings > ~/Library/Application\ Support/Sublime\ Text/Packages/User/OmniMarkupPreviewer.sublime-settings
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/sublime/Package\ Control.sublime-settings > ~/Library/Application\ Support/Sublime\ Text/Packages/User/Package\ Control.sublime-settings
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/sublime/Preferences.sublime-settings > ~/Library/Application\ Support/Sublime\ Text/Packages/User/Preferences.sublime-settings
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/sublime/SublimeLinter.sublime-settings > ~/Library/Application\ Support/Sublime\ Text/Packages/User/SublimeLinter.sublime-settings
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/sublime/trailing_spaces.sublime-settings > ~/Library/Application\ Support/Sublime\ Text/Packages/User/trailing_spaces.sublime-settings
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/sublime/Default.sublime-keymap > ~/Library/Application\ Support/Sublime\ Merge/Packages/User/Default.sublime-keymap

NEWEST_PYTHON_VERSION=$(pyenv versions | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1 | tr -d ' ')

pyenv virtualenv $NEWEST_PYTHON_VERSION sublimetext
pyenv local sublimetext
pip install --upgrade pip
pip install --upgrade setuptools
pip install flake8
pyenv local --unset
