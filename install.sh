#!/bin/bash
lowercase(){
  echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

OS=`lowercase \`uname\``
echo 'name:'
read name
echo 'email:'
read email

set -v
rm -rf ~/.ackrc
rm -rf ~/.bash_profile
rm -rf ~/.bashrc
rm -rf ~/.gemrc
rm -rf ~/.gitconfig
rm -rf ~/.irbrc
rm -rf ~/.zshrc
rm -rf  ~/bin

ln -s "$PWD"/ackrc ~/.ackrc
ln -s "$PWD"/bash_profile ~/.bash_profile
ln -s "$PWD"/bashrc ~/.bashrc
ln -s "$PWD"/gitconfig ~/.gitconfig
ln -s "$PWD"/gemrc ~/.gemrc
ln -s "$PWD"/irbrc ~/.irbrc
ln -s "$PWD"/zshrc ~/.zshrc
ln -s "$PWD"/bin ~/bin

set +v

printf "%s[user]%s\n  name = %s$name%s\n  email = $email" >> ~/dotfiles-local/gitconfig.local
if [ "{$OS}"=="darwin" ]
then
  printf "%s\n[credential]%s\n  helper = osxkeychain" >> ~/dotfiles-local/gitconfig.local
fi
