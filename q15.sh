#!/bin/bash
elinks -dump $1 > $3
elinks -dump $2 >> $3
cat $3 | tr "[:punct:]" " " | tr -s " " | tr " " "\n" | sort | uniq -c | awk '{ print $2" "$1 }' | sort -k2nr -k1 > $3
