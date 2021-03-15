[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
[[ -f "$HOME/.bash_local" ]] && . "$HOME/.bash_local"
export PATH="$PATH:$HOME/.local/bin"

bind 'set mark-symlinked-directories on' # adds / on tab completion for symlinks

# Utility
alias ls='ls -l'
alias lsa='ls -la'
alias ..='cd ..'
alias getBash='rsync ~/git/utilities/.profile ~/'
alias pushBash='rsync ~/.profile ~/git/utilities/'
alias ebash='nano ~/.profile'
alias ebashl='nano ~/.bash_local'
alias sc='source ~/.profile && source ~/.bash_local'
alias list-functions='declare | egrep '\''^[[:alpha:]][[:alnum:]_]* ()'\''; echo -e "\nTo print a function definition, issue \`type function-name\` "'
alias scvenv='source .venv/bin/activate'

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

# docker
alias docker='sudo docker'
alias docker-machine='sudo docker-machine'


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


# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\u:\[\e[32m\]\w\[\e[m\]:\[\e[33m\]\`parse_git_branch\`\[\e[m\]\\$ "
export EDITOR=nano
# disable bell sound in some tools like man pages and less.
export LESS="$LESS -R -Q"
