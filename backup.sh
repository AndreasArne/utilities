# backup packages
dpkg --get-selections | grep -v deinstall > /media/backup/backup_packages
# sudo cp /media/backup/backup_packages /media/discworld/backup/

# install with:

# sudo dpkg --set-selections <./backup_packages
# apt-get -y update
# apt-get dselect-upgrade

# backup files
# join split files "cat os_backup.part* > backup.tar.gz.joined"
# restore "tar xvpfz backup.tar.gz.joined -C /"
sudo tar -czf - --exclude=backup_packages --exclude=backup.tar.gz --exclude=/bin --exclude=/home/desktop --exclude=/var/lib/docker --exclude=/media --exclude=/dev --exclude=/mnt --exclude=/proc  --exclude=/sys --exclude=/tmp / | split -b 512m - "/media/backup/os_backup-part"
sudo cp /media/backup/* /media/discworld/backup
