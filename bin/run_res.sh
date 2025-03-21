  # Si on veut "melder" les .res a la fin:
  # crit_meld = $(1)
  # crit_meld = 0
  #
  REPERTOIRE_ACT=$(\pwd)
  repertoire_dgibi=$REPERTOIRE_ACT/"cas_tests_PAP"
  #
  nb_dgibi=$(ll $repertoire_dgibi/*.dgibi | wc -l)
  echo "nbr de dgibi = "$nb_dgibi
  echo "repertoire_dgibi = "$repertoire_dgibi
  castScript="castem21"
  # rm *.res
  rm $repertoire_dgibi/*.res
  compilcast21 -cd *.eso
  essaicast21
  for i in $repertoire_dgibi/*.dgibi ; do 
      echo $i
      echo "FIN;" | $castScript ${i%.dgibi}.dgibi > ${i%.dgibi}.res 2> /dev/null ; 
  done;
  #
  # creation des fichiers _ref.res:
  echo "On compile les sources originales"
  repertoire_orig=$REPERTOIRE_ACT/"orig21"
  cd $repertoire_orig
  compilcast21 -cd *.eso
  essaicast21
  echo $(\pwd)
  for i in $repertoire_dgibi/*.dgibi; do 
    echo $i
    echo "FIN;" | $castScript ${i%.dgibi}.dgibi > ${i%.dgibi}"_ref".res 2> /dev/null ; 
  done;
  cd $REPERTOIRE_ACT
      
