#!/bin/sh
# usage: [lid]
LID=$1
LESSON_INFO=`cat lesson_map.txt | sed -n "/^$LID /p" | sed -n '1p'`
if [ -z "$LESSON_INFO" ]
then
	echo 'error: no such lesson.' >&2
else
	LNAME=`echo $LESSON_INFO | cut -d ' ' -f 2-`
	if [ ! -z "$LNAME" ]
	then
		rm -r "files/$LNAME/"
		mv exclude_lid.txt exclude_lid.old
		sed -e "/^$LID$/d" exclude_lid.old > exclude_lid.txt
		rm exclude_lid.old
	fi
fi

