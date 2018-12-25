#!/bin/bash
arr=("$@")
res=${arr[0]}
for((i=1;i<$#;i++))
do
res=$((res**${arr[$i]}))
done
echo $res
