#!/bin/bash
#
#killall program; elapsed time longer than entered time
#

tottime=10.00
dtt=$(date)

tm=($(ps eaxo etime,pid,comm | egrep "ProgramName" | grep -v grep | awk '{print $1}' | awk -F : '{ printf("%.2f\n", $1*60+$2+($3/60)); }'))
length="${#tm[@]}"
for (( j=0; j<"$length"; j++ ));
do
	if [[ $(echo "if (${tm[$j]} > ${tottime}) 1 else 0" | bc) -eq 1 ]]; then
		
		   echo "killed - ${tm[$j]} > ${tottime} - ${dtt}" >> 'killed.log'
		   echo $(ps aux | grep -i ProgramName) >> 'killed.log'
			 echo "-----------------------------------" >> 'killed.log'
		   killall ProgramName
		   break
	else
		echo "${tm[$j]} <= ${tottime} - ${dtt}"
	fi
done

exit 0
