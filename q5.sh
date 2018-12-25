#!/bin/bash
cat $1 $2 > newfile1.txt
arr=("$@")
k=0
for((i=2;i<$#;i++))
do
newarr[$k]=$(echo "-k${arr[$i]}")
k=$((k+1))
done
s=$(echo "-n ${newarr[@]}" )
cat newfile1.txt | sort $s
