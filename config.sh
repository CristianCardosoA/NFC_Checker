#!/bin/bash
UUID=""

CLASS=$(whiptail --title "Choose Only One Package" --radiolist \
"List of packages" 20 100 10 \
"oo" "Analisis y diseno O.O." OFF \
"apple" "Swift Apple" OFF 3>&1 1>&2 2>&3)

for(( ; ; ))do

	NAME=$(whiptail --title "Nombre" --inputbox "Nombre" 8 40 3>&1 1>&2 2>&3)
	LASTNAME=$(whiptail --title "Apellido" --inputbox "Apellido paterno" 8 40 3>&1 1>&2 2>&3)
	EMAIL=$(whiptail --title "Email" --inputbox "Email" 8 40 3>&1 1>&2 2>&3)

        echo "Esperando conexion ..."
 	UUID=$(./reader-nfc)
	TERM=ansi whiptail --title "UNAM FCA CONFIG NFC" --infobox "NOMBRE: $NAME $LASTNAME \nEMAIL: $EMAIL \nNFC TAG: $UUID" 20 78
	whiptail --title "CONFIRMACION" --yesno "Should I proceed" 8 78 
	if [[ $? -eq 0 ]]; then 
		echo "$UUID,$NAME,$LASTNAME,$EMAIL,$CLASS" >> alumnos.csv
  		whiptail --title "MESSAGE" --msgbox "Completado" 8 78 
	elif [[ $? -eq 1 ]]; then 
  		whiptail --title "MESSAGE" --msgbox "Cancelado ...<NO>." 8 78 
	elif [[ $? -eq 255 ]]; then 
  		whiptail --title "MESSAGE" --msgbox "Saliendo ..." 8 78 
	fi
	sleep 2;
done;

exit 0
