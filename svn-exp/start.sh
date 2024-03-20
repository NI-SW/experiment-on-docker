#!/bin/bash

if [ -n "$USER" ]
then 
    mkdir /data
    chmod 755 /data
    svnadmin create /data;
    sed -i s/".*anon-access = .*"/"anon-access = none"/ /data/conf/svnserve.conf
    sed -i s/".*auth-access = .*"/"auth-access = write"/ /data/conf/svnserve.conf
    sed -i s/".*password-db = .*"/"password-db = passwd"/ /data/conf/svnserve.conf
    sed -i s/".*authz-db = .*"/"authz-db = authz"/ /data/conf/svnserve.conf
    sed -i s/".*realm = My First Repository.*"/"authz-db=authz"/ /data/conf/svnserve.conf

    if [ -n "$PASSWD" ]
    then
        echo "
$USER=$PASSWD
" >> /data/conf/passwd
    else
        echo "
$USER=$USER
" >> /data/conf/passwd
    fi

    echo "
[/]  
$USER=rw
" >> /data/conf/authz

fi

svnserve -d -r /data/

tail -F /data/locks/db-logs.lock