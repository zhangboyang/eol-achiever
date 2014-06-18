#!/bin/sh
if [ -s file_list.txt ]
then
	cat file_list.txt | while read i
	do
		echo fetch file: $i
		./fetch_single_file.sh $i
	done
fi

