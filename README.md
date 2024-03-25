# mysql-cluster-experiment
A simple mysql innodb cluster in docker, build for experiment XD

startup example:

command:

    cd /path/to/mysql-cluster
    
    docker build -t mysql-cluster:latest .
    
    echo 'MYSQL_PASSWD={yourpassword}
    
    MYCLUSTER_NAME={yourclustername}' > config
  
    docker-compose up -d
    
    docker ps
  
    docker exec -it --user root {CONTAINER ID} /bin/bash
