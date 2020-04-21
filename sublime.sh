ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
ln -s /Applications/Sublime\ Merge.app/Contents/SharedSupport/bin/smerge /usr/local/bin/smerge
git clone https://github.com/higurashi-takuto/sublime-dark-theme.git ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/sublime-dark-theme
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/sublime/Package\ Control.sublime-settings > ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/sublime/Preferences.sublime-settings > ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/sublime/SublimeLinter.sublime-settings > ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/SublimeLinter.sublime-settings
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/sublime/trailing_spaces.sublime-settings > ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/trailing_spaces.sublime-settings
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/sublime/Default.sublime-keymap > ~/Library/Application\ Support/Sublime\ Merge/Packages/User/Default.sublime-keymap
