#!/bin/bash

nombre=$(cat /etc/passwd | cut -d: -f1 | grep -E ^$1$)

if [[ $nombre = $1 ]];
then
	echo existe
else
 	echo "no existe"
fi
