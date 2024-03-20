#!/bin/bash
MySQL_PASS=$(cat /data/mysql/log/mysqld.log | grep "A temporary password" | awk '{print $NF}')
mysql -u root -p"${MySQL_PASS}" < /root/str.sql --connect-expired-password
#mysqlsh --uri root@localhost:13306 < cfgclu.cfg