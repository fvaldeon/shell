#!/bin/bash

if [[ $(( $1 * $2)) -eq 4 &&  $1 -ge $2  ]]; then

	echo bien
else
	echo mal
fi

expr $1 \* $2
