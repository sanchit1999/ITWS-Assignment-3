#!/bin/bash
read sign
read n
for((i=0;i<$n;i++))
do
read arr[$i]
done
if [[ "$sign" == "+" ]]
then
res=${arr[0]}
for((i=1;i<$n;i++))
do
res=$(bc <<< "scale=4;$res+${arr[$i]}")
done
fi
if [[ "$sign" == "-" ]]
then
res=${arr[0]}
for((i=1;i<$n;i++))
do
res=$(bc <<< "scale=4;$res-${arr[$i]}")
done
fi
if [[ "$sign" == "*" ]]
then
res=${arr[0]}
for((i=1;i<$n;i++))
do
res=$(bc <<< "scale=4;$res*${arr[$i]}")
done
fi
if [[ "$sign" == "/" ]]
then
res=0
for((i=0;i<$n;i++))
do
res=$(bc <<< "scale=4;$res/${arr[$i]}")
done
fi
printf "%0.4f\n" $res
