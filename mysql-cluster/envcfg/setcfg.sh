#!/bin/bash
sed -i s/"ALTER USER 'root'@'localhost' IDENTIFIED BY.*"/"ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_PASSWD';"/ /root/str.sql
sed -i s/"CREATE USER 'root'@'%' IDENTIFIED BY.*"/"CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_PASSWD';"/ /root/str.sql
sed -i s/"ALTER USER 'root'@'%' IDENTIFIED WITH 'caching_sha2_password' BY.*"/"ALTER USER 'root'@'%' IDENTIFIED WITH 'caching_sha2_password' BY '$MYSQL_PASSWD';"/ /root/str.sql
sed -i s/"mysqladmin -u root -p.*"/"mysqladmin -u root -p$MYSQL_PASSWD shutdown"/ /root/restartmysql.sh
sed -i s/"var c = dba.createCluster.*"/"var c= dba.createCluster('$MYCLUSTER_NAME')"/ /root/example.clustercfg


