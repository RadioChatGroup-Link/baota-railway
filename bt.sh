#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

init_path=/etc/init.d
Root_Path=`cat /var/bt_setupPath.conf`
Setup_Path=$Root_Path/server/mysql
Data_Path=$Root_Path/server/data

soft_start(){
    ${init_path}/nginx start
    ${init_path}/bt restart
    pkill crond
    /sbin/crond
}

soft_start > /dev/null

tail -f /dev/null
