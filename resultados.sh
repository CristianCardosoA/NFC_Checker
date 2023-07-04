#!/bin/bash
UUID=""
CLASE=$1

for(( ; ; ))do
        echo "Esperando conexion ..."
 	UUID=$(./reader-nfc)
        NAME=$(grep $UUID ./alumnos.csv | awk -F',' '{ print $2 }')
        LASTNAME=$(grep $UUID ./alumnos.csv | awk -F',' '{ print $3 }')
        NUMA=$(grep -nr $UUID asistencias | wc -l)
        NUMP=$(grep -nr $UUID participaciones | wc -l)
	TERM=ansi whiptail --title "UNAM FCA RESULTADOS" --infobox "Nombre:$NAME $LASTNAME  \nAsistencias: $NUMA  \nParticipaciones: $NUMP" 20 78
	sleep 10;
done;

exit 0
