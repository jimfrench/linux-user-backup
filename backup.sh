#!/bin/bash
echo "=========================================="
echo "System backup script version 1.01"
echo "Written by Jim French, Top Hat Electronics"
echo "=========================================="
echo ""
echo "Two backups are kept on the inserted media <$1>"
echo "The existing backup will be copied to a file named <backup-previous.tar.gz>"
echo "The backup about to be created will then create a file named <backup-current.tar.gz>"
echo ""
echo "Enter root password and press enter to start backup or press CTRL+Z to cancel:"
echo ""
cd "$1"
sudo ./run-backup.sh $1
exit
echo "script finished"
