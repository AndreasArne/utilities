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
alias sstud='ssh -i ~/.ssh/dbwebb anar12@seekers.student.bth.se'

alias sc='source ~/.profile && source ~/.bash_local'
alias list-functions='declare | egrep '\''^[[:alpha:]][[:alnum:]_]* ()'\''; echo -e "\nTo print a function definition, issue \`type function-name\` "'

# tmux
# https://github.com/fatso83/dotfiles/commit/35a7ed
# https://github.com/fatso83/dotfiles/commit/43d481956c73826cc9cfe1d971e91e2ae3c3dfe9#diff-64848524db7ba4dea710a785457b57ecR189
tmux-r () {
    if [[ -n $1 ]]; then
        local setup_file="$HOME/.tmux/$1.proj"
        if [[ -e $setup_file ]]; then
            $(which tmux) new-session "tmux $2 source-file $setup_file"
        else
            printf "\nNo such file \"$setup_file\".\nListing existing files:\n\n"
            ls -1 ~/.tmux/*.proj
            return 1
        fi
    else
        echo "Usage: tmux-restore my-js-setup <optional command>"
        return 1
    fi
}

# copy tmux project settings
linktmux () {
    SOURCE="${1:-$HOME/git/utilities}"
    DEST="${2:-$HOME}/.tmux"
    echo "$SOURCE" "$DEST"
    ls "$SOURCE"
    # link whole tmux dir
    ln -sf "$SOURCE/.tmux" "$DEST"

    # if [[ ! -d "$DEST" ]]; then
    #     mkdir "$DEST"
    # fi
    # for file in "$HOME/git/utilities/.tmux/*.proj"; do
    #    echo "$file"
    #    ln -sf "$file" "${DEST}/"
    # done
}

# disable bell sound in some tools like man pages and less.
export LESS="$LESS -R -Q"
