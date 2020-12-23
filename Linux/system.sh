#!/usr/bin/zsh

# Free memory output to a free_mem.txt file
echo "Backing up free memory to ~/backups/freemem/free_mem.txt ..."
echo "MEMORY INFO:" > ~/backups/freemem/free_mem.txt
free -h >> ~/backups/freemem/free_mem.txt

# Disk usage output to a disk_usage.txt file
echo "Backing up disk usage to ~/backups/diskuse/disk_usage.txt ..."
echo "DISK USAGE:" > ~/backups/diskuse/disk_usage.txt
du -h >> ~/backups/diskuse/disk_usage.txt

# List open files to a open_list.txt file
echo "Backing up open files list to ~/backups/openlist/open_list.txt ..."
echo "OPEN FILES:" > ~/backups/openlist/open_list.txt
lsof >/dev/null 2>&1 >> ~/backups/openlist/open_list.txt

# Free disk space to a free_disk.txt file
echo "Backing up free disk space to ~/backups/freedisk/free_disk.txt ..."
echo "FREE DISK:" > ~/backups/freedisk/free_disk.txt
df -h >> ~/backups/freedisk/free_disk.txt