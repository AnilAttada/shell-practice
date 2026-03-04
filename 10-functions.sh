#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "run with root access"
else 
    echo "running with root access"
fi

dnf list installed httpd

if [ $? -ne 0 ]
then
    echo "httpd is not installed......going to install"
dnf install httpd -y

if [ $? -eq 0 ]
then
    echo "httpd is installed....SUCCESS"
else   
    echo " httpd is not installed.....FAILURE"
fi

else
    echo " httpd is installed...already present"
fi