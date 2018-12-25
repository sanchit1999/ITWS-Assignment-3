#!/bin/bash
read str
res=1
n=${#str}
str1=$(echo "${str,,}")
for((i=0;i<$n;i++))
do
x=`echo ${str1:$i:1}`
y=`echo ${str1:$((n-i-1)):1}`
if [ "$x" != "$y" ]
then
res=0
break
fi
done
if test $res -eq 1
then
echo YES
else
echo NO
fi
