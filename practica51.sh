#!/bin/bash

# Practica 51 TecnoZubia
# Script que recibe como parametros los nombres de ficheros o directorios
# Por cada fichero/directorio muestra un menu que permite:
# mostrar la ruta del fichero/directorio, mostrar su contenido
# mostrar sus permisos

### primero declaro las funciones

function menu()
{
local fichero_directorio=$1
echo "Menu"
echo "a) Visualizar ruta del fichero/directorio $fichero_directorio"
echo "b) Visualizar el contenido del fichero/directorio $fichero_directorio"
echo "c) Visualizar los permisos del fichero/directorio $fichero_directorio"
echo
echo "Elige opcion (a, b, c):"

}

function visualizar_contenido()
{
	local fichero_directorio=$1
	if [[ -f $fichero_directorio ]] 
	then
		cat $fichero_directorio
	elif [[ -d $fichero_directorio ]] 
	then
		ls $fichero_directorio
	else
		echo "$fichero_directorio no es ni fichero ni directorio"
	fi
}

function visualizar_permisos()
{
	local fichero_directorio=$1
#muestro los permisos en octal %a y en caracteres %A
	stat -c "%a  %A" $1

}


### programa principal

if [ $# -eq 0 ] ; then
	echo "debe introducir ficheros como parametro"
	exit 1
fi

for fich in $*
do
	clear
	menu $fich
	read opt

	fichero_real="$(locate --regexp "$fich" -l1)"

	case $opt in
	a)
		echo $fichero_real
	;;
	b)
		visualizar_contenido $fichero_real
	;;
	c)
		visualizar_permisos $fichero_real
	;;
	*)
		echo "opcion no contemplada"
	;;
	esac
done

