#!/bin/bash
arr="$1"
arr2="${arr//)/ }"
arr3="${arr2//(/ }"
echo "("$arr3")" | tr -s " " | rev | sed 's/ //' | rev | sed 's/ //'

