#!/bin/bash

#carring out a check to make sure the approriate data is entered in 2 argyments

if [ $# -ne 2 ]

then
	echo "The right data usage is: backup.sh<Originated_dir> <destination_dir>"

	echo "Enter the arguments"
	exit 1

fi

if ! command -v resync> /dev/null 2>$1
then
	echo "we have to use resync, validate if installed"
	echo " Please package manager to install then re-run the script again"
	exit 2
fi

#Acounting into base on time-stamp format"

cur_date=$(date +%Y-%m-%d)
rsync_opt="-avb --backup-dir $2/$cur_date --delete"
$(which rsync) $rsync_opt $1 $2/current>>backup_$current_date.log
