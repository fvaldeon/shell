#Esto se ejecuta al inicio del programa
BEGIN{
	print "INICIO"
}

# Esta parte se ejecuta para cada fila
{
	ex1+=$2
	ex2+=$3
	ex3+=$4
	alumnos++
	media=($2+$3+$4)/3
	apto="si"
	if(media < 5) {
		apto="no"
	}
	print $1"="media" Apto: "apto
}


#Esto se ejecuta al final del programa
END{
	print ""
	print "Total alumnos:"alumnos
	print "media1="ex1/alumnos
	print "media2="ex2/alumnos
	print "media3="ex3/alumnos
	print NR " numero registros"
}
