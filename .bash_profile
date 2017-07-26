# Utility
alias ls='ls -l'
alias lsa='ls -la'
alias ebash='atom ./~/.bash_profile'
alias ..='cd ..'
alias getBash='rsync ~/git/utilities/.bash_profile ~/'
alias pushBash='rsync ~/.bash_profile ~/git/utilities/'

# cd
alias cgit='cd ~/git/'

# Git
alias gs='git status'
alias gcm='git commit -m'
alias gp='git push'
alias gpr='git pull --rebase'
alias ga='git add'
alias gc='git checkout'

alias sc='source ~/.bash_profile && source ~/.bash_local'

#source ~/.bash_local

[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
