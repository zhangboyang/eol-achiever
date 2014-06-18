#!/bin/sh
USERPASS=`sed -n -e '/^[ \t]*$/d' -e '/^#/d' -e '1p' userpass.conf`
USERNAME=`echo "$USERPASS" | cut -f 1`
PASSWORD=`echo "$USERPASS" | cut -f 2`
echo "$USERNAME" > passwd.txt
echo "$PASSWORD" >> passwd.txt
echo using user: $USERNAME >&2
./login.sh

for i in `seq -w 9999`
do
	if ./id_checker.sh $1$i
	then
		echo $12$i
	fi
done

./rm_if_exist.sh passwd.txt cookies.txt

