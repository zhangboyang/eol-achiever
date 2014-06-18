#!/bin/sh
if [ ! -d files ]
then
	mkdir files
fi
touch exclude_lid.txt

./login.sh
./bfs_folder.sh
./fetch_file.sh
./rm_if_exist.sh cookies.txt file_list.txt lesson_list.txt 

