#!/bin/bash
lowercase(){
  echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

OS=`lowercase \`uname\``
# echo 'name:'
# read name
# echo 'email:'
# read email

configFiles=(
  "ackrc"
  "bash_profile"
  "bashrc"
  "gemrc"
  "gitconfig"
  "irbrc"
  "tmux.conf"
  "zshrc"
)

for t in ${configFiles[@]}; do
 echo "Removing .$t"
 rm -rf ~/.$t
 echo "symlinking $t to ~/.$t"
 ln -s $PWD/$t ~/.$t
done

echo "Creating dotfile-local directory for non-repo config files"
mkdir -p "$PWD"/dotfiles-local
[ -e ~/dotfiles-local ] || ln -s "$PWD"/dotfiles-local ~/dotfiles-local

rm -rf ~/bin
ln -s "$PWD"/bin ~/bin

echo "Installing Xcode theme"
XCODE_THEME_INSTALL_PATH=~/Library/Developer/Xcode/UserData/FontAndColorThemes
XCODE_THEME_NAME=base16-twilight.dark.xccolortheme

[ -e $XCODE_THEME_INSTALL_PATH ] || mkdir -p $XCODE_THEME_INSTALL_PATH
[ -e "$XCODE_THEME_INSTALL_PATH"/"$XCODE_THEME_NAME" ] || ln -s "$PWD"/macOS/"$XCODE_THEME_NAME" "$XCODE_THEME_INSTALL_PATH"/"$XCODE_THEME_NAME"

echo "Updating Homebrew"
brew bundle install

echo "Updating git config.loca with user and email"
printf "%s[user]%s\n  name = %s$name%s\n  email = $email" >> ~/dotfiles-local/gitconfig.local
if [ "{$OS}"=="darwin" ]
then
  printf "%s\n[credential]%s\n  helper = osxkeychain" >> ~/dotfiles-local/gitconfig.local
fi
