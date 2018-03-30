## fichier : reverse.sh ###
#!/bin/bash                   
 
#fonction: selecteur P arg1 arg2 ... argN
#-> affiche l'argument de position P (1 à N)
selecteur(){
	NUM=0  	#sera le numero de passage dans la boucle
			#et donne ainsi le numéro de l'argument pour ce passage 
			
	FIND=$1  #position de l'argument à sélectionner
	
    for V in $@ ; do
		if [ $NUM -eq $FIND ]; then  #on est sur la 
			echo $V             # position recherchee ?
			return         #on met fin à la fonction
		fi
		NUM=$(($NUM + 1))     #calcul de la prochaine position
	done
	}

N=$#        #nombre d'argument reçu
RESULT=""   #va contenir la liste des arguments réordonnés
SEL=$N      #on va faire une boucle pour faire varier SEL de N à 1
            #SEL sera la position de l'argument à afficher à chaque passage

while [ $SEL -gt 0 ]; do
	ARG=$(selecteur $SEL $@)  #argument se trouvant sur la position SEL
	RESULT="$RESULT $ARG"     #on ajoute cet argument dans la liste final
	SEL=$(($SEL - 1))         #on diminue SEL de 1
done 

#affichage du résultat
echo $RESULT 
  