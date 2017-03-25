#!/bin/bash

echo "hello world"

while getopts :i: o
do 		case "$o" in
		i) FILE_ERE="$OPTARG";;
		*) printf "Prepinac -i potrebuje argument \n" >&2
                exit 1;;
		esac
done

OPTIND=$((OPTIND-1))

shift $OPTIND

DIR="$1"

if [ -z "$FILE_ERE" ]
then
	if [ -z "$DIR" ]
	then
		# file_ere is empty and dir is empty
		DIR=$(pwd)
		FILE_ERE="$^"
	else
		# file_ere is empty and dir is not empty
		FILE_ERE="$^"
	fi
else
	if [ -z "$DIR" ]
	then
		#file_ere is not empty and dir is empty
		DIR=$(pwd)
	fi
fi
