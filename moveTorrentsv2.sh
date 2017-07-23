#!/usr/bin/bash

# Name of the script
SCRIPT=$( basename "$0" )

# Current version
VERSION="2.0.0"

# Location structure
STRUCTURE=1

string=""

#
# Message to display for usage and help.
#
function usage
{
    local txt=(
"Utility $SCRIPT for moving downloaded files and torrent files to NAS."
"Usage: $SCRIPT [options] <command> [arguments]"
""
"Command:"
"  download     Move downloaded files."
"  torrents     Move torrent files."
""
"Options:"
"  --help, -h           Print help."
"  --version, -h        Print version."
"  --label, -l	        Specify which label folder to move file to."
"  -s1                  All downloaded files are in one folder. Default behavior, change with -s2."
"  -s2                  Downloaded files are in Label folder structure."
	)

    printf "%s\n" "${txt[@]}"
}



#
# Message to display when bad usage.
#
function badUsage
{
    local message="$1"
    local txt=(
"For an overview of the command, execute:"
"$SCRIPT --help"
    )

    [[ $message ]] && printf "$message\n"

    printf "%s\n" "${txt[@]}"
}



#
# Message to display for version.
#
function version
{
    local txt=(
"$SCRIPT version $VERSION"
    )

    printf "%s\n" "${txt[@]}"
}



#
# Move files to server
#
function sendFiles {
    # echo "rsync -av -e \"ssh -p $port\" $1 $user@$ip:$2"
    string+="rsync -av -e \"ssh -p $port\" $1 $user@$ip:$2 && "

    # rsync -av -e "ssh -p $port" $1 $userq@$ip:$2
}



#
# Read config
#
function readConfig {
    conf=./moveTorrents.config

    if [ -f $conf ]; then
        echo "Found config"
    else
        echo "Your config file doesn't exist!"
        exit 1
    fi

    # Source config for variables
    source $conf
}



#
# Move downloaded files, with rsync, to NAS.
# Moves to default download folder for torrents.
#
function loopFiles {
    for file in $dir_files
    do
        sendFiles $file $files_target
    done
}


#
# Move downloaded files, with rsync, to NAS.
# Moves to default download folder for torrents.
#
function loopFilesStructure {

    echo "${labelFolders[0]}"
    ## now loop through the above array
    for i in "${labelFolders[@]}"
    do
        location=$dir_files$i"*"
        target=$files_target_path$i
        echo "##################################"
        echo "location $location"
        echo "target $target"
        for file in $location
        do
            echo "file $file"
            sendFiles $file $target
        done
    done
    echo $string

}



#
# Move torrent files, with rsync, to NAS.
# Moves to a "to download" folder. Deluge finds torrent file and adds torrent.
#
function loopTorrents {
    for file in $dir_torrents
    do
        sendFiles $file $torrents_target
    done
}


readConfig


#
# Process options
#
while (( $# ))
do
    echo $1
    case "$1" in

        --help | -h)
            usage
            exit 0
        ;;

        --version | -v)
            version
            exit 0
        ;;

        -s1)
            STRUCTURE=2
            shift
        ;;

        -s2)
            STRUCTURE=2
            shift
        ;;

        download)
            if (( $STRUCTURE == 1 )) ; then
                loopFiles
            elif (( $STRUCTURE == 2 )) ; then
                loopFilesStructure
            else
                echo "Invalid choice!!"
            fi
            exit 0
        ;;

        torrents)
            loopTorrents
            exit 0
        ;;

    esac
done

badUsage
exit 1
