#!/bin/bash 

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run script with root access"
    exit 1
else
    echo "you are running as root user"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo " Mysql is not installed...Installing"
dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "Installing Mysql...SUCCESS"
else 
    echo "Installing Mysql...FAILURE"
    exit 1
fi
else 
    echo "Mysql is already installed..Nothing to do"
fi