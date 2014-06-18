#!/bin/sh
# usage: [folderid] [lid] [path]
TMP_FILENAME=folder_$1_$2.txt
MY_PATH=`echo $* | cut -d ' ' -f 3-`
./wget_with_check.sh -q -O - "http://course.pkuschool.edu.cn/eol/common/script/listview.jsp?acttype=enter&folderid=$1&lid=$2" --load-cookies=cookies.txt | ./conv.sh > $TMP_FILENAME

cat $TMP_FILENAME | ./parse_folder_list | sed -e 's/\r//g' | while read i
do
	A=`echo $i | cut -d ' ' -f 1,2`
	B=`echo $i | cut -d ' ' -f 3- | ./escape.sh`
	mkdir "files/$MY_PATH/$B"
	echo $A $MY_PATH/$B
done

cat $TMP_FILENAME | ./parse_file_list | sed -e 's/\r//g' | while read i
do
	A=`echo $i | cut -d ' ' -f 1-3`
	B=`echo $i | cut -d ' ' -f 4- | ./escape.sh`
	echo $A $MY_PATH/$B >> file_list.txt
done
./rm_if_exist.sh $TMP_FILENAME

