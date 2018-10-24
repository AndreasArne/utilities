[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
[[ -f "$HOME/.bash_local" ]] && . "$HOME/.bash_local"

# Utility
alias ls='ls -l'
alias lsa='ls -la'
alias ..='cd ..'
alias getBash='rsync ~/git/utilities/.profile ~/'
alias pushBash='rsync ~/.profile ~/git/utilities/'
alias ebash='nano ~/.profile'
alias ebashl='nano ~/.bash_local'

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
alias gsi='git submodule update --init --recursive'
alias gsu='git submodule update --recursive --remote'

# ssh
alias sstud='ssh anar12@sweet.student.bth.se'

alias sc='source ~/.profile && source ~/.bash_local'
