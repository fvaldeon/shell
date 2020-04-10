#!/bin/bash

# Practica 69 Ejercicio2 TecnoZubia
# crea un script que reciba el fichero creado en el script anterior
# comprueba que se pasa solo un parametro
# comprueba que el fichero existe y no esta vacio
# muestra por cada linea algo similar a esto
# Calificacion	numero	porcentaje
#	6	1	3%
#
#
# Alumnos con un 10
# xxxxxxxxx
# Alumnos con un 1
# xxxxxxxxx

if [ $# -ne 1 ]
then
	echo "se esperaba un parametro"
	exit -1
fi

if [ -e $1 ]
then

# Sin pasar variable de cantidad de registros
# echo "Total Alumnos: " "$(cat "$1" | wc -l )"
# awk -f practica69-awk $1 

# Pasando variable con cantidad de registros
#awk -v regs="$(cat "$1"|wc -l)" -f practica69-awk $1 

# No hace falta variable ya que se muestra el resultado al final
 awk -f practica69-awk $1
 awk -f alumnos10-awk $1
 awk -f alumnos1-awk $1
else
	echo "el fichero no existe"
fi
