#!/bin/sh
# Finder script for a string in a path
# Author: Manuel Merei


#set -e 
#set -u

FILESDIR=$1
SEARCHSTR=$2


if [ $# -lt 2 ]
then
	echo "Invalid amount of arguments."
	echo "Total number of arguments should be 2."
	echo "The order of arguments should be:"
	echo "1)File Directory Path."
	echo "2)String to be searched in the specified directory path."
	exit 1
fi


if [ ! -d "$FILESDIR" ]
then
	echo "Directory does not exist"
	exit 1
fi



if [ $? -eq 0 ]
then
	X=$(find $FILESDIR -type f | wc -l)      # Amount of files in dir found.
	
	Y=$(grep -R -e "$SEARCHSTR" $FILESDIR | wc -l) # Total amount of matching lines found.
	
	echo "\nThe amount of files is ${X} and the amount of matching lines is ${Y}"
	return 0
else
	echo "Something went wrong"
	return 1
fi

