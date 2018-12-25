#!/bin/bash
com="$1"
if [ "$com" == "read" ]
then
comno=1
readtype="$2"
if [ "$readtype" == "eno" ]
then
readno=1
seno=$3
elif [ "$readtype" == "ename" ]
then
readno=2
sename="$3"
elif [ "$readtype" == "esalary" ]
then
readno=3
sesal=$3
fi
elif [ "$com" == "write" ]
then
comno=2
weno=$2
wename="$3"
wesal=$4
elif [ "$com" == "update" ]
then
comno=3
ueno=$2
uename="$3"
uesal=$4
elif [ "$com" == "delete" ]
then
comno=4
deno=$2
elif [ "$com" == "duplicate" ]
then
comno=5
elif [ "$com" == "nthsalary" ]
then
comno=6
n=$2
fi
len=$(cat employee.txt | wc -l)
for((i=1;i<=$len;i++))
do
y=$(cat employee.txt | head -$i | tail -1)
eno[$i]=$(echo $y | cut -d "," -f 1)
ename[$i]=$(echo $y | cut -d "," -f 2)
esal[$i]=$(echo $y | cut -d "," -f 3)
done
if [ $comno == 1 ] && [ $readno == 1 ] 
then
for((i=1;i<=$len;i++))
do
if [ ${eno[$i]} == $seno ]
then
cat employee.txt | head -$i | tail -1
fi 
done
elif [ $comno == 1 ] && [ $readno == 2 ]
then
for((i=1;i<=$len;i++))
do
if [[ "${ename[$i]}" == "$sename" ]]
then
cat employee.txt | head -$i | tail -1
fi 
done
elif [ $comno == 1 ] && [ $readno == 3 ]
then
for((i=1;i<=$len;i++))
do
if [ ${esal[$i]} == $sesal ]
then
cat employee.txt | head -$i | tail -1
fi 
done
fi
if [ $comno == 2 ]
then
echo "$weno,$wename,$wesal" >> employee.txt
fi
if [ $comno == 3 ]
then
#echo "eno,ename,esal" > employee2.txt
for((i=1;i<=$len;i++))
do
if [[ "${ename[$i]}" == "$uename" ]]
then
#awk 'NR==$i {$0="$ueno,$uename,$uesal"} { print }' employee.txt
temp=$i 
fi 
done
for((i=1;i<$temp;i++))
do
echo "${eno[$i]},${ename[$i]},${esal[$i]}" >> employee2.txt
done
echo "$ueno,$uename,$uesal" >> employee2.txt
for((i=$((temp+1));i<=$len;i++))
do
echo "${eno[$i]},${ename[$i]},${esal[$i]}" >> employee2.txt
done
#awk 'NR==$i {$0="$ueno,$uename,$uesal"} { print }' employee.txt
mv employee2.txt employee.txt
fi
if [ $comno == 4 ]
then
#echo "eno,ename,salary" > employee2.txt
for((i=1;i<=$len;i++))
do
if [ ${eno[$i]} != $deno ]
then
#echo "eno,ename,salary" >> employee2.txt
#sed '$id' employee.txt
echo "${eno[$i]},${ename[$i]},${esal[$i]}" >> employee2.txt
fi 
done
#sed '$id' employee.txt
mv employee2.txt employee.txt

fi
if [ $comno == 5 ]
then
for((i=1;i<=$len;i++))
do
for((j=$((i+1));j<=$len;j++))
do
if [ ${eno[$i]} == ${eno[$j]} ] && [[ "${ename[$i]}" == "${ename[$j]}" ]] && [ ${esal[$i]} == ${esal[$j]} ]
then
cat employee.txt | head -$i | tail -1
fi 
done
done
fi
if [ $comno == 6 ]
then
#echo $n
#t=$(sort -k3 -n employee.txt)
cat employee.txt | tail -$((len-1)) | cut -d "," -f3 | sort -nr | uniq | head -n$n | tail -1 > abc.txt
#t=$(echo $o | sort -nr | uniq)
t=$(cat abc.txt)
#echo $t
rm abc.txt
for((i=2;i<=$len;i++))
do
cat employee.txt | head -$i | tail -1 | cut -d "," -f3 > abc.txt
temp2=$(cat abc.txt)
#echo $temp2
rm abc.txt
if [ $temp2 == $t ]
then
cat employee.txt | head -$i | tail -1
fi
done
fi
















