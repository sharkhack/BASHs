#!/usr/bin/env bash
#
# Azer Bulbul
#
# split strings in file than write first item to another file
# in items.txt like;
# item1 dsc ...n
# item2 dsc ...n
# item3 dsc ...n
# ....
# itemN dcs ..n
#
# out - output.txt
# item1
# item2
# ....
# itemN

while IFS=$' ' read -r -a myArray
do
 echo "${myArray[0]}" >> "output.txt"
done < "items.txt"
