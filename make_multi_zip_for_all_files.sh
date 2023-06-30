#!/bin/bash

ZIP_FILE_COUNT=1
FILE_COUNT=1
ZIP_FILE_NAME="json_logs_${ZIP_FILE_COUNT}.zip"
DIR=$1


if [ ! -d $1 ]
then
    exit -1
fi

for FILE in $DIR
do
    if [ $FILE_COUNT -ne 6000 ]
    then
        zip -r $ZIP_FILE_NAME $FILE
    fi

    let FILE_COUNT++

    if [ $FILE_COUNT -eq 6000 ]
    then
        let ZIP_FILE_COUNT++
        ZIP_FILE_NAME="json_logs_${ZIP_FILE_COUNT}.zip"
        FILE_COUNT=0 
    fi
done
