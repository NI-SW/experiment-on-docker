#!/bin/bash
init=0
chown -R mysql:mysql /data
chmod 755 /data
cat /data/mysql/data/auto.cnf
if [ $? != 0 ] #if not initialized
then 
    init=1
    mkdir -p /data/mysql/data /data/mysql/log /data/mysql/run/mysqld/ /data/mysql/lib/mysql
    chown -R mysql:mysql /data
    chmod 755 /data
    /usr/sbin/mysqld --defaults-file=/etc/my.cnf --initialize
else
    mkdir -p /data/mysql/log /data/mysql/run/mysqld/ /data/mysql/lib/mysql
    chown -R mysql:mysql /data
    chmod 755 /data
fi

nohup /usr/sbin/mysqld --defaults-file=/etc/my.cnf >> /root/hup.log 2>&1 &
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
if [ $init = 1 ]
then 
    
    /root/strmysql.sh
    rm -rf /root/strmysql.sh 
fi
rm -rf /root/str.sql /root/setcfg.sh
tail -F /data/mysql/log/mysqld.log


















