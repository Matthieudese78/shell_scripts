 # MARCHE PAS!!!
 REPERTOIRE_ACT=$(\pwd)
 REPERTOIRE_ORIG=$REPERTOIRE_ACT/"orig21"
 nb_sources=$(ll $REPERTOIRE_ACT/*.eso | wc -l)
 echo "nbr de sources = "$nb_sources
 for i in $REPERTOIRE_ACT/*.eso ; do
      echo " i = "$i
      echo " {i%.eso}.eso = "${i%.eso}.eso
      meld ${i%.eso}.eso  $REPERTOIRE_ORIG/${i%.eso}.eso ;
  done ;
