#!/bin/bash

dotfiles_dir=~/dotfiles
backup_dir=/tmp/$USER-dotfiles-backup

echo "Moving existing dotfiles to $backup_dir"
mkdir -p $backup_dir
cp -v ~/.zshrc $backup_dir 2> /dev/null
cp -v ~/.vimrc $backup_dir 2> /dev/null
cp -v ~/.tmux.conf $backup_dir 2> /dev/null
cp -v ~/.bashrc $backup_dir 2> /dev/null

echo "Creating symlinks"
ln -sfv $dotfiles_dir/zshrc ~/.zshrc
ln -sfv $dotfiles_dir/vimrc ~/.vimrc
ln -sfv $dotfiles_dir/tmux.conf ~/.tmux.conf
ln -sfv $dotfiles_dir/oh-my-zsh/themes/telf.zsh-theme ~/.oh-my-zsh/themes/telf.zsh-theme
