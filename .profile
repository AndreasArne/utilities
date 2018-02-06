[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

# Utility
alias ls='ls -l'
alias lsa='ls -la'
alias ..='cd ..'
alias getBash='rsync ~/git/utilities/.profile ~/'
alias pushBash='rsync ~/.profile ~/git/utilities/'
alias ebash='sudo nano ~/.profile'
alias ebashl='sudo nano ~/.bash_local'

# cd
alias cgit='cd ~/git/'

# Git
alias gs='git status'
alias gcm='git commit -m'
alias gp='git push'
alias gpr='git pull --rebase'
alias ga='git add'
alias gc='git checkout'
alias gd='git diff'
alias sn='sudo nano'

alias sc='source ~/.profile && source ~/.bash_local'
