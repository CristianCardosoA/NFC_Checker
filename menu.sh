#!/bin/bash

OPTION=$(whiptail --title "Cristian Cardoso FCA" --menu "Selecciona una opcion" 25 78 5 \
"1" "Asistencia O.O" \
"2" "Participacion O.O" \
"3" "Asistencia APPLE" \
"4" "Participacion APPLE" 3>&1 1>&2 2>&3)

case $OPTION in
  1)
    ./asistencia.sh OO;;
  2)
    ./participacion.sh OO;;
  3)
    ./asistencia.sh APPLE;;
  4)
    ./participacion.sh APPLE;;
  *)
    echo "Exit ..."
  ;;
esac
