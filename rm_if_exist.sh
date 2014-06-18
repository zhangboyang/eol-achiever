#!/bin/sh
for i in $*
do
	if [ -f $i ]
	then
		rm $i
	fi
done

