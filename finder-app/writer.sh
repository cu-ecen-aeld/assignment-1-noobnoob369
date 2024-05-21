#!/bin/sh
# This sketch saves a given string into the given path
# Author: Manuel Merei


WRITEFILE=$1 # Complete path with filename
WRITESTR=$2  # String which will be written into the file.


if [ $# -lt 2 ]
then
	echo "Invalid amount of arguments"
	echo "Please enter 2 arguments:"
	echo "1) Complete path where the file should be saved including the filename"
	echo "2) String with should be saved into the file."
	exit 1
fi


if [ $? -eq 0 ]
then
	if [ ! -d $WRITEFILE ]
	then 
       		install -D /dev/null $WRITEFILE

		printf "$WRITESTR" > $WRITEFILE
	fi

	echo "File sucessfull created/ overwritten. "
	return 0
else
	echo "Something went wrong"
	return 1
fi       
