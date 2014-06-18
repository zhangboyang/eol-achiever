#!/bin/sh
./compile.sh
sed -e '/^[ \t]*$/d' -e '/^#/d' userpass.conf | while read i
do
	USERNAME=`echo "$i" | cut -f 1`
	PASSWORD=`echo "$i" | cut -f 2`
	echo "$USERNAME" > passwd.txt
	echo "$PASSWORD" >> passwd.txt
	echo achieve for user: $USERNAME
	./achieve_single.sh
done
./rm_if_exist.sh passwd.txt

