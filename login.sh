#!/bin/sh
USERNAME=`sed -n -e '1p' passwd.txt`
PASSWORD=`sed -n -e '2p' passwd.txt`
wget -q -O /dev/null "http://course.pkuschool.edu.cn/eol/homepage/common/login.jsp" --post-data="IPT_LOGINPASSWORD=$PASSWORD&IPT_LOGINUSERNAME=$USERNAME" --keep-session-cookies --save-cookies=cookies.txt
#cat cookies.txt >&2
