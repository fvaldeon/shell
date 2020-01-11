#!/bin/bash

if [ $# -eq 1 ]; then

	nombre=$(grep -E ^$1: /etc/passwd | cut -d: -f1)

	if [[ $nombre ]]; then
		if [[ $nombre == $1 ]]; then
			echo "SI"
		fi
	else
		echo "NO"
	fi
fi
