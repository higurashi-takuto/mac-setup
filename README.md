# macOSのセットアップ
## setup.sh
```console
$ xcode-select --install
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/main/setup.sh | zsh
```

## その他の設定
MacBook 系を使っている場合は充電音を切るため、以下のコマンドも実行する。
```console
$ defaults write com.apple.PowerChime ChimeOnNoHardware -bool true
$ killall PowerChime
```
