alias ls='ls -G'
alias ll='ls -hl'
alias bake='bundle exec rake'
alias be='bundle exec'
alias bi='bundle install'
alias be='bundle exec'
alias bu='bundle update'
alias gs='git status'
alias gad='git add .'
alias gc='git commit'
alias gca='git commit -a'
alias gcaa='git commit -a --amend -C HEAD'
alias gcb='git checkout -b'
alias gcl='git clone'
alias gcm='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias get='sudo apt-get install'
alias gg='git lg'
alias gpush='git push'
alias gpsuh='git push'
alias gpr='git pull --rebase'
alias grc='git rebase --continue'
alias git-clean='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
alias fs='foreman start'
alias rdm='be rake db:migrate'
alias rdtp='be rake db:test:prepare'

alias download="curl -OJ"

alias waste=history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head

alias tmux="tmux -2"
