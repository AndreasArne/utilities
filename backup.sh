# backup packages
dpkg --get-selections | grep -v deinstall > /media/backup/backup_packages
sudo cp /media/backup/backup_packages /media/discworld/backup/
# install with:

# sudo dpkg --set-selections <./backup_packages
# apt-get -y update
# apt-get dselect-upgrade

# backup files
sudo tar czf /media/backup/backup.tar.gz --exclude=/backup_packages --exclude=/backup.tar.gz --exclude=/bin --exclude=/home/desktop --exclude=/var/lib/docker/overlay2 --exclude=/media --exclude=/dev --exclude=/mnt --exclude=/proc  --exclude=/sys --exclude=/tmp /
sudo cp /media/backup/backup.tar.gz /media/discworld/backup
