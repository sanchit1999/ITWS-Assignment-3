#!/bin/bash
HISTFILE=~/.bash_history
set -o history
history | tr -s " " | cut -d " " -f 3 | sort | uniq -c | sort -nr | awk ' { t = $1; $1 = $2; $2 = t; print; } '


