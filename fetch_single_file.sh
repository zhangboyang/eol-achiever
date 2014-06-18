#!/bin/sh
# usage: [fileid] [resid] [lid] [save_to_path]
D='	'
MY_PATH=`echo $* | cut -d ' ' -f 4-`
TMP_FILENAME=$1_$2_$3.bin
HEADER_FILENAME=$1_$2_$3.header
./wget_with_check.sh -q -O - "http://course.pkuschool.edu.cn/eol/common/script/download.jsp?fileid=$1&resid=$2&lid=$3" --load-cookies=cookies.txt --save-headers | ./split_response $HEADER_FILENAME $TMP_FILENAME
FILENAME=`cat $HEADER_FILENAME | ./conv.sh | grep "Content-Disposition: " | sed -e 's/^[^\"]*\"//g' -e 's/\"[^\"]*$//g'`
CONTENT_TYPE=`cat $HEADER_FILENAME | ./conv.sh | grep "Content-Type: " | sed -e 's/^[^ ]* //g' -e 's/\r$//g'`
FILENAME_SAVE=`echo "$MY_PATH" | sed -e 's/^.*\///'`
if [ -z "$FILENAME" ]
then
	FILENAME=unknown
	FILEEXT=`cat content_type.conf | sed -e '/^[ \t]*$/d' -e '/^#/d' | grep "$CONTENT_TYPE" | sed -n -e '1p' | cut -f 2`
	if [ -z "$FILEEXT" ]
	then
		FILEEXT=unknown
		echo 'error: unknown Content-Type, you may add some information to content-type.conf, see README for details.' >&2
	fi
else
	FILEEXT=`echo "$FILENAME" | sed -e 's/^.*\.//'`
fi
mv $TMP_FILENAME "files/$MY_PATH.$FILEEXT"
echo "$FILENAME$D$CONTENT_TYPE$D$FILENAME_SAVE.$FILEEXT" >> file_map.txt
./rm_if_exist.sh $HEADER_FILENAME

