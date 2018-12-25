#!/bin/bash
filename="$1"
n=$#
crontab $filename > /dev/null 2>&1
q=$?
if [ $q == 0 ]
then
echo Yes
else
echo No
fi
