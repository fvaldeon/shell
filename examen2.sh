#!/bin/bash

#simule fin sin find ni ls
# de 1 a 3 parámetros
# si 1 find$1
# si 2 find $1/$2
# si 2 con opcion $1= -s ls -r | grep $2
# si 3 find $1/$2 ls -r | grep $1/$2

if [[ $# == 1 ]]; then

  #echo * | grep $1
  for FICHERO in *; do
    if [[ $FICHERO == $1 ]]; then
      echo $FICHERO
    fi
  done
  exit 0

fi

if [[ $# == 2 ]]; then

  if [[ $1 == "-s" ]]; then
    #buscarEnDirectorioRecursiva . $2
    du -a | cut -f2 |grep -E "^.*/$2$"
  else
    for FICHERO in $1/*; do
      if [[ $FICHERO == $2 ]]; then
        echo $FICHERO
      fi
    done
  exit 0

fi

function buscarEnDirectorioRecursiva(){
  DIRECTORIO=$1
  BUSQUEDA=$2

  cd $DIRECTORIO

  for FICHERO in *; do
    if [[ -d $FICHERO ]]; then
	buscarEnDirectorioRecursiva $FICHERO $BUSQUEDA
    elif [[ $FICHERO == $BUSQUEDA ]]; then
	echo "$(pwd)"/$FICHERO
      
    fi
  done



}


if [[ $# == 1 ]]; then

  if [[ $1 != "-s" ]]; then
    echo "Opcion incorrecta"
  fi
  
  if( [[ -d $2 ]]; then


fi

echo "Numero de parametros erroneo"
exit 1

