JAVA_HOME=/Library/Java/Home
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
#rvm initialization code
#if [[ -s /Users/Matt/.rvm/scripts/rvm ]] ; then source /Users/Matt/.rvm/scripts/rvm ; fi

#rbenv initialization code
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


