#!/bin/sh
if [ -e new_bfs_queue.txt ]; then
	rm new_bfs_queue.txt
fi

cat bfs_queue.txt | while read i
do
	echo listing folder: $i
	./get_folder_list.sh $i >> new_bfs_queue.txt
done
mv new_bfs_queue.txt bfs_queue.txt

