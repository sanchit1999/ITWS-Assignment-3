#!/bin/bash
read str
month=$(echo "$str" | cut -d " " -f 1)
date=$(echo "$str" | cut -d " " -f 2 | cut -d "," -f 1)
year=$(echo "$str" | cut -d " " -f 2 | cut -d "," -f 2)
valid=1
echo "enter date format- MM/DD/YYYY or DD-MM-YYYY"
read format
if [[ "$format" == "MM/DD/YYYY" ]]
then
formatval=1
fi
if [[ "$format" == "DD-MM-YYYY" ]]
then
formatval=2
fi
if [[ "$month" == "january" ]] || [[ "$month" == "jan" ]]
then
monthval=01
if [[ $date -lt 1 ]] || [[ $date -gt 31 ]]
then
valid=0
fi
fi
if [[ "$month" == "march" ]] || [[ "$month" == "mar" ]]
then
monthval=03
if [[ $date -lt 1 ]] || [[ $date -gt 31 ]]
then
valid=0
fi
fi
if [[ "$month" == "apr" ]] || [[ "$month" == "april" ]]
then
monthval=04
if [[ $date -lt 1 ]] || [[ $date -gt 30 ]]
then
valid=0
fi
fi
if [[ "$month" == "may" ]]
then
monthval=05
if [[ $date -lt 1 ]] || [[ $date -gt 31 ]]
then
valid=0
fi
fi
if [[ "$month" == "jun" ]] || [[ "$month" == "june" ]]
then
monthval=06
if [[ $date -lt 1 ]] || [[ $date -gt 30 ]]
then
valid=0
fi
fi
if [[ "$month" == "july" ]] || [[ "$month" == "jul" ]]
then
monthval=07
if [[ $date -lt 1 ]] || [[ $date -gt 31 ]]
then
valid=0
fi
fi
if [[ "$month" == "aug" ]] || [[ "$month" == "august" ]]
then
monthval=08
if [[ $date -lt 1 ]] || [[ $date -gt 31 ]]
then
valid=0
fi
fi
if [[ "$month" == "september" ]] || [[ "$month" == "sep" ]]
then
monthval=09
if [[ $date -lt 1 ]] || [[ $date -gt 30 ]]
then
valid=0
fi
fi
if [[ "$month" == "october" ]] || [[ "$month" == "oct" ]]
then
monthval=10
if [[ $date -lt 1 ]] || [[ $date -gt 31 ]]
then
valid=0
fi
fi
if [[ "$month" == "november" ]] || [[ "$month" == "nov" ]]
then
monthval=11
if [[ $date -lt 1 ]] || [[ $date -gt 30 ]]
then
valid=0
fi
fi
if [[ "$month" == "december" ]] || [[ "$month" == "dec" ]]
then
monthval=12
if [[ $date -lt 1 ]] || [[ $date -gt 31 ]]
then
valid=0
fi
fi
if [[ "$month" == "february" ]] || [[ "$month" == "feb" ]]
then
monthval=02
temp=$((year%100))
temp2=$((year%400))
temp3=$((year%4))
if [ $temp == 0 ] && [ $temp2 == 0 ]
then
if [[ $date -lt 1 ]] || [[ $date -gt 29 ]]
then
valid=0
fi
elif [ $temp == 0 ] && [ $temp2 != 0 ]
then
if [[ $date -lt 1 ]] || [[ $date -gt 28 ]]
then
valid=0
fi
elif [ $temp != 0 ] && [ $temp3 == 0 ]
then
if [[ $date -lt 1 ]] || [[ $date -gt 29 ]]
then
valid=0
fi
elif [ $temp != 0 ] && [ $temp3 != 0 ]
then
if [[ $date -lt 1 ]] || [[ $date -gt 28 ]]
then
valid=0
fi
fi
fi
if [ $valid == 0 ]
then
echo "Invalid"
elif [ $valid == 1 ] && [ $formatval == 1 ]
then
echo "$monthval/$date/$year"
elif [ $valid == 1 ] && [ $formatval == 2 ]
then
echo "$date-$monthval-$year"
fi
#echo $monthval
