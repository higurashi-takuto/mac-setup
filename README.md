# macOSのセットアップ
## setup.sh
```console
$ xcode-select --install
$ curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/setup.sh | zsh
```

JupyterLab で外部アクセスを許可する場合は以下のコマンドも実行する。
```console
$ jupyter notebook password
$ sed -i '' s/"#c.NotebookApp.ip = 'localhost'"/"c.NotebookApp.ip = '0.0.0.0'"/ .jupyter/jupyter_notebook_config.py
```

## sublime.sh
Sublime Text の設定
```console
$ curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/sublime.sh | zsh
```

## .Brewfile
Homebrew は便利。

## .Brewfile_lite
使用頻度の低いものを削除。
```console
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/.Brewfile_lite > .Brewfile
```

## .gitignore_global
macOS 用にいろいろ無視。

## .zshrc
Sublime Text 以外は許さん。

## iTerm2.json
iTerm2 用のプロファイル。

## jupyterlab.plist
JupyterLab を自動起動にする設定ファイル。

## 個別でインストールするソフト一覧
- [UAD SOFTWARE](https://www.uaudio.jp/uad/downloads/)
- [Affinity](https://store.serif.com/ja-jp/account/downloads/)
