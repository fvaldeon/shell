#!/bin/bash

# Practica 69 Ejercicio1 TecnoZubia: script creafich
# Pide por teclado el nombre de fichero
# Comprueba si existe previamente, o si se quiere sobrescribir
# Pide pore teclado el nombre y nota y se crea el fichero con la estructura:
# Nombre y Apellidos: Nota
# Se introducen alumnos hasta que no queramos introducir más alumnos

echo "indica el nombre del fichero:"
read fich

if [ -d $fich ] 
then
	echo "el fichero $fich es un directorio"
	exit 2
fi

if [ -e $fich ]; then
	echo "el fichero ya existe. Desea sobrescribir? (s/n)"
	read resp
	
	if [ $resp == "n" ];
	then
		exit 1
	else
		rm fich
	fi
fi

touch $fich

echo "Introduce nombre y apellidos del alumno"
read nombre
echo "introduce nota del alumno $nombre"
read nota

while [[ $nota -gt 10 || $nota -lt 0 ]]
do
	echo "La nota es entre 0 y 10"
	echo "introduce nota del alumno $nombre"
	read nota

done

echo "$nombre: $nota" >> $fich

echo "desea annadir otro alumno? (s/n)"
read resp

until [ $resp == n ]
do
	echo "Introduce nombre y apellidos del alumno"
	read nombre
	echo "introduce nota del alumno $nombre"
	read nota

	while [ $nota -gt 10 -o $nota -lt 1 ]
	do
		echo "La nota es entre 0 y 10.introduce nota del alumno $nombre"
		read nota
	done

	echo "$nombre: $nota" >> $fich

	echo "desea annadir otro alumno? (s/n)"
	read resp
done

