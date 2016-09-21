alias py='python'
alias ls='gls --color=auto'
# eval $(gdircolors ~/Documents/config/dircolors-solarized)
export PATH="/usr/local/bin":$PATH
export PATH="/usr/local/sbin:$PATH"
alias ls='ls -lGwF'
alias la='ls -alh'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

# itermのタブにdirを表示
export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"'
#echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
