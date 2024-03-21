Example:

    mysqlrouter --bootstrap root@mysql_1:13306 --user=mysqlrouter --force
    
    nohup mysqlrouter -c /etc/mysqlrouter/mysqlrouter.conf >> /root/router.log  2>&1 & 
