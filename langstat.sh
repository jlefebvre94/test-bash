#!/bin/bash

#verifie la presence du 1er paramètre - le fichier
ARG1=${1:?"il manque le 1er paramètre contenant le nom du fichier"}


#Verifie la presence de dico.txt
if [ ! -e $ARG1 ]
then
	echo "Le ficher $ARG1 n'existe pas !"
elif [ ! -f $ARG1 ]
then
	echo "Le fichier $ARG1 est un lien ou un répertoire !"
elif [ ! -r $ARG1 ]
then
	echo "Vous n'avez pas les droits en lecture sur le fichier $ARG1 !"
else
	for lettre in {A..Z}
	do
		nb=$(grep -c $lettre $ARG1)
		echo "$nb - $lettre" >> temp
	done
	sort -n -r temp | cat
	rm temp
fi




