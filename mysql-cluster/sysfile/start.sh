#!/bin/bash
echo '* soft nofile 65535
* hard nofile 65535' >> /etc/security/limits.conf

ulimit -n

yum install -y /root/mysql-cluster-* mysql-shell mysql-router;

echo '[client]
port = 13306
socket = /data/mysql/lib/mysql/mysql.sock

[mysqld]
port = 13306
read_only=0
log_bin_trust_function_creators=TRUE
datadir = /data/mysql/data
pid-file = /data/mysql/run/mysqld/mysqld.pid
socket = /data/mysql/lib/mysql/mysql.sock
log-error = /data/mysql/log/mysqld.log
character_set_server = utf8mb4
user = mysql
bind-address = *
default_storage_engine = InnoDB
max_allowed_packet = 512M
max_connections = 20480
open_files_limit = 65535
symbolic-links=0
key_buffer_size = 64M
connect_timeout = 3600
wait_timeout = 3600
interactive_timeout = 3600
explicit_defaults_for_timestamp = true
 
innodb_buffer_pool_size = 4G
innodb_buffer_pool_instances=4
' > /etc/my.cnf







