#!/bin/bash

if [ -f /tmp/mysql-root-password.txt ]; then
# /tmp/mysql-root-password.txt file is present
    PASSWORD=$(cat /tmp/mysql-root-password.txt)
    #before this main container- init conatiner runs and keeps the password in this loactaion- /tmp/mysql-root-password.txt
    echo "Accessed MySQL root password"
else
    echo "MySQL Root password file not found"
    exit 1
fi

export MYSQL_ROOT_PASSWORD=$PASSWORD
rm -rf /tmp/mysql-root-password.txt
exec /entrypoint.sh mysqld