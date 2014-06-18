#!/bin/sh
./get_lesson_list.sh
./rm_if_exist.sh file_list.txt

while [ -s bfs_queue.txt ]
do
	./search.sh
done

rm bfs_queue.txt
