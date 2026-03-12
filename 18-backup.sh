#!/bin/bash

USERID=$(id -u)
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]
then 
    echo -e "$R ERROR :: run with root access $N" | tee -a $LOG_FILE
    exit 1
else 
    echo -e "$G running with root access $N" | tee -a $LOG_FILE
fi

USAGE(){
    echo -e "$R USAGE:: $N sh 18-backup.sh <source-dir> <dest-dir> <days(optional)>"
}

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is installed....$G SUCCESS $N" | tee -a $LOG_FILE
    else    
        echo -e "$2 is not installed..... $R FAILURE $N" | tee -a $LOG_FILE
    fi

}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e " $R source-dir $SOURCE_DIR is not present $N "
    exit 1
fi
if [ ! -d $DEST_DIR ]
then
    echo -e " $R dest-dir $DEST_DIR is not present $N "
fi

FILES=$( find $SOURCE_DIR -name "*.log" -mtime +$DAYS )

if [ ! -z $FILES ]
then
    echo "files to zip are: $FILES"
    TIME_STAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE="$DEST_DIR/app-logs-$TIME_STAMP.zip"
    echo $FILES | zip -@ $ZIP_FILE
else
    echo -e "No files found to zip older than 14 days...$Y SKIPPING $N"
fi