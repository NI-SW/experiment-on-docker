#!/bin/bash
mkdir -p /data/mysql/data /data/mysql/log /data/mysql/run/mysqld/ /data/mysql/lib/mysql
chown -R mysql:mysql /data
chmod 755 /data

cat /data/mysql/data/auto.cnf
if [ $? != 0 ] 
then 
    /usr/sbin/mysqld --defaults-file=/etc/my.cnf --initialize
fi

nohup /usr/sbin/mysqld --defaults-file=/etc/my.cnf >> /data/mysql/log/hup.log 2>&1 &
while((1))
do
    grep "/usr/sbin/mysqld: ready for connections." /data/mysql/log/mysqld.log
    if [ $? != 1 ]
    then
        break
    fi
    sleep 1
done
/root/setcfg.sh
/root/strmysql.sh
rm -rf /root/setcfg.sh /root/strmysql.sh /root/str.sql
rm -rf /root/strsys.sh
tail -F /data/mysql/log/mysqld.log


















