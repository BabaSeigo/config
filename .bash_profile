export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"


# export PYTHONPATH="/Users/babaseigou/Documents/pyWorkSpace/":$PYTHONPATH
findpy(){
  find $1 -name "*.py" | xargs grep --color -n $2
}

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi



set -o vi
set -o noclobber
export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"'
export LSCOLORS=gxfxcxdxbxegedabagacad
alias grep='grep --color'
alias diff='vimdiff'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias py='python'
alias h='history'
alias vimbash='vim $HOME/.bash_profile'
alias sourcebash='source $HOME/.bash_profile'
alias nkfsjis='nkf -w --overwrite -s'
alias nkfutf='nkf -w --overwrite'
alias ls='ls -lGwFt'
alias la='ls -alht'
# alias vimsnippets='vim /Users/s-baba/.vim/bundle/neosnippet-snippets/neosnippets/sql.snip'
alias less='/usr/local/share/vim/vim74/macros/less.sh'
function gitinit(){
	git init
	wget 'https://raw.githubusercontent.com/BabaSeigo/config/master/.gitignore'
}
