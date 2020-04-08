# .dotfiles

### Greetings!

I really only made this for myself so I would in no way recomend actually 
running this unless you are me. If you're not me have fun poking about and 
feel free to send me questions.

Currently my .zshrc and .vimrc need a bit of cleanup. I have been changing 
over to installing everything via brew instead of a hodgepodge of installers
so current zsh compains slightly no matter which machine I start it on, yay!

#### Last run

My best time from unbox to all this setup with working iterm, zsh, vim,
Rstudio dev environment, and a general python datascience dev environment
is currently 2 hours. 

The major hangups last time:

* I had not documented installing my prefered font needed for Powerline to work (fixed)
* Xcode install is so slow

### Scott setup your computer

To get started manually run the below

#### Get brew and the general utilities working: 

```
# install brew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install git
brew install mas
```

#### Manual headaches: 

Log into the apple app store interface and restart shell before running setup scripts

Install R from here: https://cran.r-project.org/bin/macosx/
The brew version is nothing but trouble.

Clone this repo.


#### The magic part:

Then go run the setup script from the setup directory

I never remember if permissions travel with git but if not make sure its 
executable:

```
chmod +rwxrwxr-- setup_script_1
```

#### Vim: 

After running the setup scrips go into vim and run `:PlugInstall`

Then to get you complete me working run:

```
cd .vim/plugged/youcompleteme/
python3 install.py --all
```

#### Powerline:

```
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

Install these 4 font for powerline:

https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf



### Quick refernce notes for later 


The below (and more) are run in the startup script but keeping them
here for easy reference too! 


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
