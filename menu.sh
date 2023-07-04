#!/bin/bash

OPTION=$(whiptail --title "L.I Cristian Cardoso UNAM-FCA" --menu "Selecciona una opcion" 20 78 10 \
"1" "Asistencia O.O" \
"2" "Participacion O.O" \
"3" "Asistencia APPLE" \
"4" "Participacion APPLE" \
"5" "Configuracion" \
"6" "Guardar y enviar " \
"7" "Resultados" \
"8" "Resultados exportar" 3>&1 1>&2 2>&3)

case $OPTION in
  1)
    ./asistencia.sh OO;;
  2)
    ./participacion.sh OO;;
  3)
    ./asistencia.sh APPLE;;
  4)
    ./participacion.sh APPLE;;
  5)
    ./config.sh;;
  6)
    ./save.sh;;
  7)
    ./resultados.sh;;
  8)
    ./resultados_export.sh;;
  *)
    echo "Exit ..."
  ;;
esac
