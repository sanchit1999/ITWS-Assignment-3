#!/bin/bash
read str
flag=0
for((i=0;i<1000;i++))
do
x=$(echo $str | fold -w1 | shuf | tr -d "\n")
if [[ $(type -t "$x" 2>&1) == "keyword" ]] || [[ $(type -t "$x" 2>&1) == "builtin" ]] || [[ $(type -t "$x" 2>&1) == "file" ]] 
then
flag=1
echo yes
echo $x
echo "Arguments ==>"
echo
man $x | col -b | grep -a1 "^\s*-"
break
fi
done
if test $flag -eq 0
then
echo No
fi
