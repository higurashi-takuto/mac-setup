NEWEST_PYTHON_VERSION=$(pyenv versions | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1 | tr -d ' ')

pyenv virtualenv $NEWEST_PYTHON_VERSION jupyterlab
pyenv local jupyterlab
pip install --upgrade pip
pip install --upgrade setuptools
pip install jupyterlab
jupyter notebook --generate-config
pyenv local --unset

sed -i '' s/'# c.NotebookApp.open_browser = True'/'c.NotebookApp.open_browser = False'/ .jupyter/jupyter_notebook_config.py
sed -i '' s/"# c.NotebookApp.notebook_dir = ''"/"c.NotebookApp.notebook_dir = '\/Users\/takuto\/'"/ .jupyter/jupyter_notebook_config.py

mkdir Library/LaunchAgents
curl -L https://raw.githubusercontent.com/higurashi-takuto/mac-setup/master/resources/jupyterlab.plist > Library/LaunchAgents/jupyterlab.plist
launchctl load ~/Library/LaunchAgents/jupyterlab.plist
