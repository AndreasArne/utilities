#!/usr/bin/bash

function sendFiles {
    rsync -av -e "ssh -p $port" $1 $user@$ip:$2
}

conf=./moveTorrents.config

if [ -f $conf ]; then
    echo "Found config"
else
    echo "Your config file doesn't exist!"
    exit 1
fi

# Source config for variables
source $conf

# Move downloaded files, with rsync, to NAS.
# Moves to default download folder for torrents.
for file in $dir_files
do
    sendFiles $file $files_target
done

# Move torrent files, with rsync, to NAS.
# Moves to a "to download" folder. Deluge finds torrent file and adds torrent.
for file in $dir_torrents
do
    sendFiles $file $torrents_target
done
