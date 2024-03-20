# mysql-docker-exp
An simple mysql innodb cluster in docker, build for experiment XD

startup example:
command:
{
  cd mysql-cluster
  docker build -t mysql-cluster:latest .
  cd mysql-router
  docker build -t mysql-router:latest .
  cd mysql-cluster
  echo 'MYSQL_PASSWD=yourpassword
MYCLUSTER_NAME=yourclustername' > config
  docker-compose up -d
}
config mysql cluster:
  in mysql database node:
    command: "mysqlsh -u root -p" 
    then see /root/example.clustercfg
    when an output like: "Do you want to restart the instance after configuring it? [y/n]:"
    input "n"
    and then use "/root/restartmysql.sh" to restart mysql manually

you can enter a container by using "docker exec" like:

"docker ps"

CONTAINER ID   IMAGE                  COMMAND                  CREATED        STATUS        PORTS                      NAMES
e8a5dbe9c555   mysql-router:latest    "/bin/bash"               20 hours ago   Up 20 hours   0.0.0.0:13306->6446/tcp    mysql-cluster-dbrouter-1
6ced10621b4d   mysql-cluster:latest   "/bin/sh -c /root/st鈥?   20 hours ago   Up 20 hours   0.0.0.0:13307->13306/tcp   mysql-cluster-db03-1
1730d9310fc0   mysql-cluster:latest   "/bin/sh -c /root/st鈥?   20 hours ago   Up 20 hours                              mysql-cluster-db01-1
d5d33c5a3c44   mysql-cluster:latest   "/bin/sh -c /root/st鈥?   20 hours ago   Up 20 hours                              mysql-cluster-db02-1

"docker exec -it --user root 1730d9310fc0 /bin/bash"




