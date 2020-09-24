#!/bin/bash

# DOT FILE SETUP SCRIPT

LOGFILE="dot.log"

# move to .dot directory
cd ~/.dot

# remove log file
rm -f dot.log

# INSTALL
echo "-dot: Installing dot files..."

# Make backups
echo "-dot: Making backups..."
[ -d backup ] && rm -rf backup >> LOGFILE 2>&1
mkdir backup

[ -f ~/.bash_aliases ] && cp -f ~/.bash_aliases backup/bash_aliases >> LOGFILE 2>&1
[ -f ~/.bashlinux ] && cp -f ~/.bashlinux backup/bashlinux >> LOGFILE 2>&1
[ -f ~/.bashmac ] && cp -f ~/.bashmac backup/bashmac >> LOGFILE 2>&1
[ -f ~/.bashrc ] && cp -f ~/.bashrc backup/bashrc >> LOGFILE 2>&1
[ -f ~/.profile ] && cp -f ~/.profile backup/profile >> LOGFILE 2>&1
[ -f ~/.gitconfig ] && cp -f ~/.gitconfig backup/gitconfig >> LOGFILE 2>&1
[ -f ~/.gitignore ] && cp -f ~/.gitignore backup/gitignore >> LOGFILE 2>&1
[ -f ~/.vimrc ] && cp -f ~/.vimrc backup/vimrc >> LOGFILE 2>&1
[ -d ~/.vim ] && cp -rf ~/.vim backup/vim >> LOGFILE 2>&1
[ -f ~/.zsh_aliases ] && cp -f ~/.zsh_aliases backup/zsh_aliases >> LOGFILE 2>&1
[ -f ~/.zshrc ] && cp -f ~/.zshrc backup/zshrc >> LOGFILE 2>&1

# remove old files
rm -rf ~/.bash_aliases ~/.bashlinux ~/.bashmac ~/.bashrc ~/.profile ~/.gitconfig ~/.gitignore ~/.vimrc ~/.vim ~/.zsh_aliases ~/.zshrc >> LOGFILE 2>&1

# Link files
echo "-dot: Linking config files..."
ln -s ~/.dot/config/bash_aliases ~/.bash_aliases >> LOGFILE 2>&1
ln -s ~/.dot/config/bashlinux ~/.bashlinux >> LOGFILE 2>&1
ln -s ~/.dot/config/bashmac ~/.bashmac >> LOGFILE 2>&1
ln -s ~/.dot/config/bashrc ~/.bashrc >> LOGFILE 2>&1
ln -s ~/.dot/config/bashrc ~/.profile >> LOGFILE 2>&1
ln -s ~/.dot/config/gitconfig ~/.gitconfig >> LOGFILE 2>&1
ln -s ~/.dot/config/gitignore ~/.gitignore >> LOGFILE 2>&1
ln -s ~/.dot/config/vimrc ~/.vimrc >> LOGFILE 2>&1
ln -s ~/.dot/config/vim ~/.vim >> LOGFILE 2>&1
ln -s ~/.dot/config/zsh_aliases ~/.zsh_aliases >> LOGFILE 2>&1
ln -s ~/.dot/config/zshrc ~/.zshrc >> LOGFILE 2>&1

# Pull down submodules
echo "-dot: Updating submodules..."
git submodule init >> LOGFILE 2>&1
git submodule update >> LOGFILE 2>&1
git submodule foreach git pull origin master >> LOGFILE 2>&1

echo "-dot: Done."
