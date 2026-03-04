#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then 
    echo "run with root access"
else 
    echo "running with root access"
fi

dnf list installed mysql

if [ $? -ne 0]
then
    echo "Mysql is not installed......going to install"
dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "Mysql is installed....SUCCESS"
else   
    echo " Mysql is not installed.....FAILURE"
fi

else
    echo " Mysql is installed...already present"
fi