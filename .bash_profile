alias py='python'
alias ls='gls --color=auto'
eval $(gdircolors ~/Documents/config/dircolors-solarized)
export PATH="/usr/local/bin":$PATH
#export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"'
alias ls='ls -lGwF'
alias la='ls -alh'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

# itermのタブにdirを表示
echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
