# mysql-cluster-experiment
A simple mysql innodb cluster in docker, build for experiment XD

startup example:

command:

    su - root

    mkdir /data1 /data2 /data3

    chmod 755 /data1 /data2 /data3

    cd /path/to/mysql-cluster
    
    docker build -t mysql-cluster:latest .
    
    cd /path/to/mysql-router
    
    docker build -t mysql-router:latest .
    
    cd /path/to/mysql-cluster
    
    echo 'MYSQL_PASSWD={yourpassword}
    
    MYCLUSTER_NAME={yourclustername}' > config
  
    docker-compose up -d
    
    docker ps
  
    docker exec -it --user root {CONTAINER ID} /bin/bash

config mysql cluster:

    command: "mysqlsh -u root -p" 
    
    then see /root/example.clustercfg
    
    when an output like: "Do you want to restart the instance after configuring it? [y/n]:"
    
    input: "n"
    
    and use command: "/root/restartmysql.sh" to restart mysql manually
