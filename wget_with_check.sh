#!/bin/sh
if ! wget $*
then
	echo 'wget error! try log in again...' >&2
	./login.sh
	if ! wget $*
	then
		echo 'fail! you username and password might be wrong.' >&2
	fi
fi
