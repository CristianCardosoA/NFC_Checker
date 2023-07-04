#!/bin/bash
UUID=""
CLASE=$1
TERM=ansi whiptail --title "NFC Asistencia" --infobox "Clase UNAM - $CLASE" 8 78
FILE="asistencias/asistencia_$1_$(date +%F)"
touch $FILE

for(( ; ; ))do
        echo "Esperando conexion ..."
	UUID=$(./reader-nfc)
	CURRENT_DATE=`date +"%Y-%m-%d %T"`
        ROW=$(grep $UUID ./alumnos.csv)
        NAME=$(grep $UUID ./alumnos.csv | awk -F',' '{ print $2 }')
        LASTNAME=$(grep $UUID ./alumnos.csv | awk -F',' '{ print $3 }')
	TERM=ansi whiptail --title "NFC Asistencia" --infobox "Bienvendo: $NAME $LASTNAME \nHora: $CURRENT_DATE" 8 78
        echo "$ROW" >> $FILE
	uniq $FILE > tmp
	mv tmp $FILE
	sleep 2;
done;

exit 0
