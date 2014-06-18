#!/bin/sh
./wget_with_check.sh -q -O - "http://course.pkuschool.edu.cn/eol/lesson/student.lesson.list.jsp" --load-cookies=cookies.txt | ./conv.sh | ./parse_lesson_list | sort -k 2 -u | sort -k 3 > lesson_list.txt
cat lesson_list.txt >> lesson_map.txt
sort -u lesson_map.txt > lesson_map_new.txt
mv lesson_map_new.txt lesson_map.txt
sed -e 's/^/0 /' lesson_list.txt > llist.txt
./rm_if_exist.sh lesson_list.txt bfs_queue.txt
touch bfs_queue.txt
cat llist.txt | while read i
do
	LID=`echo $i | cut -d ' ' -f 2`
	RET=`grep $LID exclude_lid.txt`
	if [ -z "$RET" ]
	then
		echo $i >> bfs_queue.txt
		echo $LID >> exclude_lid.txt
	fi
done
./rm_if_exist.sh llist.txt

cat bfs_queue.txt | while read i
do
	MY_PATH=`echo $i | cut -d ' ' -f 3- | ./escape.sh`
	mkdir "files/$MY_PATH"
done

