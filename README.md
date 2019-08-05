# .dotfiles

```
# symlink .vimrc
ln -sf ~/.dotfiles/vim/.vimrc ~/.vimrc

# symlink .bashrc
ln -sf ~/.dotfiles/shells/.zshrc ~/.zshrc

# set up commands to run after vim plugins load
mkdir .vim/after
ln -sf ~/.dotfiles/vim/after_plugin ~/.vim/after/plugin
```
