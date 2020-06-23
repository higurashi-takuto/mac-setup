# macOSのセットアップ
## setup.sh
```console
$ xcode-select --install
$ curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/setup.sh | zsh
```

## sublime.sh
Sublime Text / Sublime Merge の設定
```console
$ curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/sublime.sh | zsh
```

## jupyter.sh
JupyterLab の設定
```console
$ curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/jupyter.sh | zsh
```

## resources/
### .Brewfile
Homebrew は便利。

### .gitignore_global
macOS 用にいろいろ無視。

### .zshrc
Sublime Text 以外は許さん。

### iTerm2.json
iTerm2 用のプロファイル。

### jupyterlab.plist
JupyterLab を自動起動にする設定ファイル。

## sublime/
Sublime Text / Sublime Merge の設定ファイル。

## wallpapers/
壁紙の画像。

## その他設定
JupyterLab で外部アクセスを許可する場合は以下のコマンドも実行する。
```console
$ jupyter notebook password
$ sed -i '' s/"#c.NotebookApp.ip = 'localhost'"/"c.NotebookApp.ip = '0.0.0.0'"/ .jupyter/jupyter_notebook_config.py
```

MacBook 系を使っている場合は充電音を切るため、以下のコマンドも実行する。
```console
$ defaults write com.apple.PowerChime ChimeOnNoHardware -bool true
$ killall PowerChime
```

## 個別でインストールするソフト一覧
- [UAD SOFTWARE](https://www.uaudio.jp/uad/downloads/)
- [Affinity](https://store.serif.com/ja-jp/account/downloads/)
