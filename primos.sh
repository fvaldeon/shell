#!/bin/bash

comprobar_numero() {
regex='^[0-9]+$'
if [[ $1 =~ $regex && $2 =~ $regex && $1 -gt 1 &&  $2 -gt 1 ]]; then
	return 0
else 
	return 1
fi

}

mostrar_si_primo() {
	if [[ $(factor $1 | wc -w) = 2 ]] ; then
		echo $1
	fi
}

if [[ $# -eq 2 ]] && comprobar_numero $1 $2 ; then
	for x in $(seq $1 $2)
	do
		mostrar_si_primo $x
	done


else
	echo "debe recibir dos parametros numericos mayores a 1"
fi


