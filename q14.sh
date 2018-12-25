#!/bin/bash
touch q14.html
echo "<!DOCTYPE html>
      <html>
      <body>
     <table border="1" width="1200">
  <tr>
<th colspan="3" align="center">ITWS</th>
</tr>
<tr>
<th>Name</th>
<th>Size</th>
<th>File/Dir</th>
</tr>" >> q14.html
nf=$(ls -l ~ | grep ^- | wc -l)
for((i=1;i<=$nf;i++))
do
fn=$(ls -l ~ | grep ^- | tr -s " " | cut -d " " -f9 | head -n$i | tail -1)
fs=$(ls -l ~ | grep ^- | tr -s " " | cut -d " " -f5 | head -n$i | tail -1)
fs=$(bc <<< "scale=2;$fs/1000")
echo " <tr>
<td>$fn</td>
<td>$fs K</td>
<td>File</td>
</tr>" >> q14.html
done
nd=$(ls -l ~ | grep ^d | wc -l)
for((i=1;i<=$nd;i++))
do
dn=$(ls -l ~ | grep ^d | tr -s " " | cut -d " " -f9 | head -n$i | tail -1)
dstemp=$(du -sh ~/$dn)
ds=$(echo $dstemp | tr -s " " | cut -d " " -f1)
echo " <tr>
<td>$dn</td>
<td>$ds</td>
<td>Dir</td>
</tr>" >> q14.html
done
for((i=1;i<=$nd;i++))
do
dn=$(ls -l ~ | grep ^d | tr -s " " | cut -d " " -f9 | head -n$i | tail -1)
#echo $dn
echo " <tr>
<th colspan="3" align="center">ITWS\\$dn<th>
</tr>
<tr>
<th>Name</th>
<th>Size</th>
<th>File/Dir</th>
</tr>" >> q14.html
nfd=$(ls -l ~/$dn | grep ^- | wc -l)
for((j=1;j<=$nfd;j++))
do
dfn=$(ls -l ~/$dn | grep ^- | tr -s " " | cut -d " " -f9 | head -n$j | tail -1)
dfs=$(ls -l ~/$dn | grep ^- | tr -s " " | cut -d " " -f5 | head -n$j | tail -1)
dfs=$(bc <<< "scale=2;$dfs/1000")
echo " <tr>
<td>$dfn</td>
<td>$dfs K</td>
<td>File</td>
</tr>" >> q14.html
done
ndd=$(ls -l ~/$dn | grep ^d | wc -l)
for((j=1;j<=$ndd;j++))
do
ddn=$(ls -l ~/$dn | grep ^d | tr -s " " | cut -d " " -f9 | head -n$j | tail -1)
ddstemp=$(du -sh ~/$dn/$ddn)
dds=$(echo $ddstemp | tr -s " " | cut -d " " -f1)
echo " <tr>
<td>$ddn</td>
<td>$dds</td>
<td>Dir</td>
</tr>" >> q14.html
done
done
echo " </body>
</table>
</html> " >> q14.html
firefox q14.html







