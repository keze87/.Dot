#!/bin/bash

ACTION=$(zenity --width=200 --height=230 --list --radiolist --hide-header --text="Que hago vieja?" \
--title="Salir" --column "Eleccion" --column "" \
TRUE Apagar FALSE Cerrar\ Seccion FALSE Reiniciar FALSE Suspender FALSE Apagar\ monitor)
if [ -n "${ACTION}" ];then

	case $ACTION in

		Apagar)

			systemctl poweroff

		;;

		Cerrar\ Seccion)

			i3-msg exit

		;;

		Reiniciar)

			systemctl reboot

		;;

		Suspender)

			sleep 1
			systemctl suspend

		;;

		Apagar\ monitor)

			sleep 1
			xset dpms force off

		;;

	esac

fi
