#!/bin/sh
RET=`./wget_with_check.sh -q -O - "http://course.pkuschool.edu.cn/eol/common/mail/search_info.jsp?contactUsername=$1" --load-cookies=cookies.txt | ./conv.sh | grep "可以添加此用户"`
if [ -z "$RET" ]
then
	exit 1
fi
exit 0

