#!/bin/bash

if [ "$1" == "-c" ]; then
	read -p "Please enter username: " usrname
	read -p "Please enter password: " passwd

	if id $usrname &>/dev/null
	then
		echo "$usrname ALREADY EXISTS !!!"
		exit 1
	
	else
		sudo useradd -m $usrname
		echo -e "$passwd\n$passwd" | sudo passwd "$usrname" &>/dev/null 
		echo "USER CREATED SUCCESSFULLY !!!"
	fi
	

elif [ "$1" == "-d" ]; then
	     read -p "Please enter username: " usrname

	     if id $usrname &>/dev/null
	     then
		     sudo userdel $usrname
		     echo "USER DELETED SUCCESSFULLY"
 	     else
		     echo "USER DOES NOT EXIST"
		     exit 1
             fi

elif [ "$1" == "-r" ]; then
	read -p "Please enter username: " usrname
	read -p "Please enter new password: " passwd
	if id $usrname &>/dev/null
	then
		echo -e "$passwd\n$passwd" | sudo passwd "$usrname" &>/dev/null
		echo "PASSWORD UPDATED SUCCESSFULLY !!!"
	else
		echo "NO SUCH USER EXIST"
		exit 1
	fi

elif [ "$1" == "-l" ]; then
	cat /etc/passwd | awk -F ':' '{print $1, $3}'

elif [ "$1" == "-h" ]; then
	echo -e "This script is designed for Managing Users in Systsem.\nMake sure to activate execution permissions to run this script"
	echo "-c : Creates a new User"
	echo "-d : Deletes the User"
	echo "-r: Resets the password of User"
	echo "-h: displays help option for this script"

fi


			  																		     
