
#!/bin/bash
mysqladmin -u root -pDft@passwd0 shutdown
nohup /usr/sbin/mysqld --defaults-file=/etc/my.cnf >> /data/mysql/log/hup.log 2>&1 &