#!/bin/bash
UUID=""
CLASE=$1

while read p; do
        UUID=$(echo $p | awk -F',' '{ print $1 }')
        NUMA=$(grep -nr $UUID asistencias | wc -l)
        NUMP=$(grep -nr $UUID participaciones | wc -l)
	echo "$p,$NUMA,$NUMP"

done <alumnos.csv

exit 0
