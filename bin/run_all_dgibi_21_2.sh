#!/bin/bash                                                            

# execute avec "castem${VERSION}" les cs_tests

VERSION="21"
castScript="castem${VERSION}"
echo $castScript
# pwd>REPERTOIRE_ACT
REPERTOIRE_ACT=$(\pwd)

echo "REPERTOIE_ACT = " $REPERTOIRE_ACT

repertoire_dgibi=$REPERTOIRE_ACT/"dgibi"${VERSION}

echo "repertoire_dgibi = "$repertoire_dgibi

if test `uname -m` = "x86_64" ; then  
  BIT="64"
else
  BIT="32"
fi


ulimit -t 600
ulimit -m 1400000


mkdir -p ZZZ_DEBUG_${BIT}
\rm -f ZZZ_DEBUG_${BIT}/*

# Nombre de fichier .dgibi
nb_dgibi=$(\ls -1 $repertoire_dgibi/*.dgibi | wc -l)

iOK=0
iPASOK=0 

for i in  $repertoire_dgibi/*.dgibi ; do
  # Lancement des cas tests
  echo " "
  echo $i
  
  # Suppression des .res et .err correspondant éventuellement à la liste des .dgibi lancés
  if [ -f ${i%.dgibi}.res  ]; then rm -f ${i%.dgibi}.res; fi
  if [ -f ${i%.dgibi}.err  ]; then rm -f ${i%.dgibi}.err; fi
  
  echo "FIN;" | $castScript ${i%.dgibi}.dgibi > ${i%.dgibi}.err 2> /dev/null
# si on veut l'erreur:  echo "FIN;" | $castScript ${i%.dgibi}.dgibi > ${i%.dgibi}.err 
# remarque: on retire le 2>dev/null pour obtenir les erreur
  # Test sur le niveau d'erreur en sortie de Cast3M
  mon_test=$(tail --lines=5 ${i%.dgibi}.err | fgrep -c 'ERREUR:   0')
#  mon_test=$(tail -n5 ${i%.dgibi}.err | fgrep -c 'ERREUR:   0')
  echo $mon_test
  
  if [ $mon_test = "0" ] ; then
  iPASOK=$((iPASOK+1))
  cp ${i%.dgibi}.dgibi ZZZ_DEBUG_${BIT}

  else
    iOK=$((iOK+1))
    mv -f ${i%.dgibi}.err ${i%.dgibi}.res
  fi
  echo " Cas-tests réussis :" $iOK"/"$nb_dgibi
  if [ $iPASOK != 0 ]; then
    echo " Cas-tests échoués :" $iPASOK"/"$nb_dgibi
  fi
  
  done
  
  
  # Verification des erreurs : 
  if [ $iPASOK != 0 ]; then
    # Présence d'erreurs
    echo ' '
    echo '******************************************************'
    echo '*  Liste des Cas-Tests ayant rencontré une erreur :  *'
    echo "*       Ils ont été copiés dans ZZZ_DEBUG_${BIT}        *"
    echo '******************************************************'
    \ls -1 ZZZ_DEBUG_${BIT}
    echo '******************************************************'
    echo ' '
  else
    # Rien à signaler
    echo ' '
    echo '******************************************************'
    echo '*       Aucune erreur signalee dans Test_NEW         *'
    echo '******************************************************'
    echo ' '
    \rm -rf ZZZ_DEBUG_${BIT}
  fi



