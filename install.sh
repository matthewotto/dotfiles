#!/bin/bash
rm -rf ~/.ackrc
rm -rf ~/.bash_profile
rm -rf ~/.bashrc
rm -rf ~/.gemrc
rm -rf ~/.gitconfig
rm -rf ~/.irbrc
rm -rf ~/.zshrc
rm -rf  ~/bin

ln -s ~/workspace/dotfiles/ackrc ~/.ackrc
ln -s ~/workspace/dotfiles/bash_profile ~/.bash_profile
ln -s ~/workspace/dotfiles/bashrc ~/.bashrc
ln -s ~/workspace/dotfiles/gemrc ~/.gemrc
ln -s ~/workspace/dotfiles/gitconfig ~/.gitconfig
ln -s ~/workspace/dotfiles/irbrc ~/.irbrc
ln -s ~/workspace/dotfiles/zshrc ~/.zshrc
ln -s ~/workspace/dotfiles/bin ~/bin

