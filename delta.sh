#!/bin/bash                                                                            

ARG1=${1:?"Erreur : vous devez indiquer le nom du fichier a renommer"}                    

EXTFICHIER=$(echo | cut -d . -f 2-)
CORPSFICHIER=$(echo | cut -d . -f 1)

mv $ARG1 ${CORPSFICHIER}_alice.$EXTFICHIER

******************************************************* #exo1.sh
#!/bin/bash

[ $# -eq 3 -a "$1" != "$2" -a "$1" != "$3" -a "$2" != "$3" -a "$1" \< "$2" -a "$2" \< "$3" ]

********************************************************************************* #exo2.sh
#!/bin/bash

[ -f "$1" -a $# -ge 1 -a ! -w "$1" ]

************************************************************************************ #exo3.sh
#!/bin/bash

[[ $# -ge 1 && $1 == *X* && $1 == *Y* ]]

**************************************** #ouinon.sh
#!/bin/bash

[[ $# -lt 1 ]] && echo "Vous n'avez pas donné votre réponse" && exit 3 \
|| [[ $# -gt 1 ]] && echo "Donnez une seule réponse" && exit 4 \
|| [[ $1 == o || $1 == O ]] && echo "oui" && exit 0 \
|| [[ $1 == n || $1 == N ]] && echo "non" && exit 1 \
|| echo "Pas compris" && exit 5

***************************************** 
#!/bin/bash
## fichier : testargu.sh
if [[ $# -eq 2 ]]
then 
	if [[ ! -f $1 || ! -r $1 || ! -w $1 ]] 
	then
		echo "usage : testargu.sh fichier repertoire [nombre_positif ]"
		exit 4
	elif [[ ! -d $2 || ! -x $2 ]]
	then
		echo "usage : testargu.sh fichier repertoire [nombre_positif ]"
		exit 5
	else
		echo "999" 
	fi
elif [[ $# -eq 3 ]]
then
	if [[ ! -f $1 || ! -r $1 || ! -w $1 ]] 
	then
		echo "usage : testargu.sh fichier repertoire [nombre_positif ]"
		exit 4
	elif [[ ! -d $2 || ! -x $2 ]]
	then
		echo "usage : testargu.sh fichier repertoire [nombre_positif ]"
		exit 5
	elif [[ $3 -lt 1 ]]
	then
		echo "usage : testargu.sh fichier repertoire [nombre_positif ]"
		exit 6
	else
		echo $3 
	fi
else
	echo "usage : testargu.sh fichier repertoire [nombre_positif ]"
	exit 3
fi

******************************************************* 
##!/bin/bash
## fichier : unetouche.sh

if [[ $# -ne 1 ]]
then 
	echo "Donner exactement un argument"
	exit 90
fi

case $1 in 
	[a-z]) 
		echo "Minuscule"
		exit 10
		;;
	[A-Z])
		echo "Majuscule"
		exit 11
		;;
	[0-9])
		echo "Chiffre"
		exit 12
		;;
	?)
		echo "Autre"
		exit 20
		;;
	*)
		echo "Donner un seul caractère"
		exit 91
		;;
esac

*******************************************************
#!/bin/bash
## fichier : size.sh        
declare -i i=0     #pour numeroter chaque iteration

if [ $# -eq 0 ] ; then # argument manquant 
    echo " Usage: $0 file" >&2
    exit 1
fi
if ! [  -f $1 ] ; then
    echo "Erreur: fichier $@ non existant" >&2
    exit 1
fi
 
for field in $(ls -l $1); do          
  # echo "$i -> $field"   #affichage pour trouver la 
                          #position recherchee                     
  if [ $i -eq 4 ]   # no de la position de la taille      
  then                #      sur la ligne
    echo $field       # taille du fichier  
    break    
  fi                                       
  i=$((i+1))       
done
exit 0
######################################
*****************************************************
#!/bin/bash
## fichier : size_movie_mkv.sh        

declare -i total=0 #taille total

for fichier in $(ls /home/alice/Movies/*.mkv)
do
	taille=$((taille+$(size.sh $fichier)))
done
echo $taille
##################################
****************************************************
#!/bin/bash
## fichier : format_size.sh ###
# taille en octets à formater             
taille=${1:?"Erreur: il manque la taille en argument"}  

# constantes
KIO=1024 # 1 Kio   
MIO=$((1024*$KIO)) # 1 Mio
GIO=$((1024*$MIO)) # 1 Gio

# calcul du nombre W de Gio
W=0                                                                  
while [ $taille -ge $GIO ] ; do   
  W=$(($W + 1))  # 1 Gio de plus                              
  taille=$(($taille - $GIO)) #taille restante moins 1 Gio 
done

X=0
while [ $taille -ge $MIO ] ; do   
  X=$(($X + 1))  # 1 Gio de plus                              
  taille=$(($taille - $MIO)) #taille restante moins 1 Mio 
done

Y=0
while [ $taille -ge $KIO ] ; do   
  Y=$(($Y + 1))  # 1 Gio de plus                              
  taille=$(($taille - $KIO)) #taille restante moins 1 Kio 
done

Z=$taille

echo "$W Gio $X Mio $Y Kio $Z octets"

***********************************************************
#!/bin/bash
## fichier : ploumploum.sh ###


alea() {
	nb=$(($RANDOM % ($1 +1)))
	return $nb
}

selecteur() {
	NUM=1
for V in $($@ + 1) ; do
	if [[ $NUM -eq $1 
		echo "argument $NUM = $V"
	fi
	NUM=$(( $NUM + 1 ))
done

alea $# ; selecteur $? $@
}