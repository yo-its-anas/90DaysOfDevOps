#!/bin/bash

<<info
This script takes rotational backups
info

function display_usage {
			echo "Usage: ./backup_with_rotation.sh <sourcepath> <pathtobackupdir>"
}

if [ $# -eq 0 ]; then
	display_usage
fi
source_dir=$1
backup_dir=$2
time_stamp=$(date '+%Y-%m-%d-%H-%M-%S')
function create_backup {
		zip -r "${backup_dir}/backup_$time_stamp.zip" "$source_dir" > /dev/null
		if [ $? -eq 0 ]; then
		echo "backup generated for $time_stamp"
		fi
}

function perform_rotation {
			backups=($(ls -t "${backup_dir}/backup_"*.zip)) 2>/dev/null
			if [ ${#backups[@]} -gt 5 ]; then
				echo "Performing rotation for 5 days"
				 backups_to_remove=("${backups[@]:5}")

				 for backup in "${backups_to_remove[@]}"
				 do
					 rm -f ${backup}
				 done
			fi	 
}

create_backup
perform_rotation
