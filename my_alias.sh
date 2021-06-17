#!/bin/bash

###
#  把下面这段代码放进系统加在的配置文件最后
# 如Ubuntu系统，一般在 ~/.bashrc
# Linux、mac系统，一般在 /etc/profile
#   if [ -f 【当前文件路径】 ]; then
#        . 【当前文件路径】
#   fi
##

echo  "\033[32m  load ~/my_alias/my_alias.sh \033[0m \r\n"
parse_git_branch_and_add_brackets() {
     git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}
current_ip="#"
#current_ip=$(ifconfig en0 | grep "inet " | awk '{print $2}')

PS1='\[\e[1;32m\]\u\[\e[m\]@\[\e[1;32m\]\H(${current_ip}):\[\e[0m\e[1;32m\]\W\[\e[m\]$\[\e[1;32m\]$(parse_git_branch_and_add_brackets)\[\e[m\] '
export CLICOLOR=1
export LSCOLORS=gxfxaxdxcxegedabagacad
# system
alias vi='vim'
alias l='ls -l'
alias ll='ls -laF'
# php

# projects

# git
git config --global color.ui true
git config --global alias.co checkout
git config --global alias.cm commit
git config --global alias.st status
git config --global alias.br branch
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
alias glog='git log master --date=format:"%Y-%m-%d" --pretty=format:"%Cred%h%Creset%Cgreen>>>>>>%cd>>>>>>%C(bold blue)%an>>>>>>%Cblue%s%Creset"  --since="2017-08-01 15:27:36" '
alias gs='git status'
alias ga='git add .'
alias gm='git commit -m '
alias gd='git diff '
alias gb='git branch '
alias gp='git pull'
alias gf='git fetch --all'
alias gfm='git fetch --all && git rev-parse --abbrev-ref HEAD | xargs -t -I {} git merge origin/{}'
alias gg='git rev-parse --abbrev-ref HEAD | xargs -t -I {} git push origin {}:{}'
alias gga='git rev-parse --abbrev-ref HEAD | xargs -t -I {} git push all {}:{}'
alias ggt='git rev-parse --abbrev-ref HEAD | xargs -t -I {} echo {} > /tmp/furthestworld.log && echo "git checkout gitlab_test" && git checkout gitlab_test && cat /tmp/furthestworld.log | xargs -t -I {} git merge origin/{} && echo "git push origin gitlab_test:gitlab_test" && git push origin gitlab_test:gitlab_test && echo "" > /tmp/furthestworld.log'
alias ggp='git rev-parse --abbrev-ref HEAD | xargs -t -I {} git push origin {}:pre-{}'
alias gitdebug='ga && gm "debug" && gg'
alias 有内鬼，终止交易！='echo -e "\033[33m  git merge --abort  \033[0m \r\n"'
alias "gitmergeabort"='echo -e "\033[33m 有内鬼，终止交易！\033[0m \r\n" && echo -e "\033[33m git merge --abort \033[0m \r\n" && git merge --abort'
