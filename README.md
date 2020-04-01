# .dotfiles

To get started manually run the below

```
# install brew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install git
brew install mas
```
Log into the apple app store interface and restart shell before running setup scripts

Install R from here: https://cran.r-project.org/bin/macosx/
The brew version is nothing but trouble.

After running the setup scrips go into vim and run `:PlugInstall`

The below should be run in the setup scripts

```
# symlink .vimrc
ln -sf ~/.dotfiles/vim/.vimrc ~/.vimrc

# symlink .bashrc
ln -sf ~/.dotfiles/shells/.zshrc ~/.zshrc

# set up commands to run after vim plugins load
mkdir .vim/after
ln -sf ~/.dotfiles/vim/after_plugin ~/.vim/after/plugin

# map ftplugin settings
ln -sf ~/.dotfiles/vim/ftplugin/ ~/.vim/
```



Set all environmental variables in .profile
