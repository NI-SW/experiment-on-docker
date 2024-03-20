# mysql-docker-exp
An simple mysql innodb cluster in docker, build for experiment XD

startup example:

command:

    cd mysql-cluster
    
    docker build -t mysql-cluster:latest .
    
    cd mysql-router
    
    docker build -t mysql-router:latest .
    
    cd mysql-cluster
    
    echo 'MYSQL_PASSWD=yourpassword
    
    MYCLUSTER_NAME=yourclustername' > config
  
    docker-compose up -d
    
    docker ps
  
    docker exec -it --user root <CONTAINER ID> /bin/bash

config mysql cluster:

    command: "mysqlsh -u root -p" 
    
    and see /root/example.clustercfg
    
    when an output like: "Do you want to restart the instance after configuring it? [y/n]:"
    
    input "n"
    
    and then use "/root/restartmysql.sh" to restart mysql manually
