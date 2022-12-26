# macOSのセットアップ
## setup.sh
```console
$ xcode-select --install
$ curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/setup.sh | zsh
```

## その他の設定
MacBook 系を使っている場合は充電音を切るため、以下のコマンドも実行する。
```console
$ defaults write com.apple.PowerChime ChimeOnNoHardware -bool true
$ killall PowerChime
```

## 個別でインストールするソフト一覧
- [Affinity](https://store.serif.com/ja-jp/account/downloads/)
