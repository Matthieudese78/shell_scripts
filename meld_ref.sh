  # MELD .res / _ref.res:
  REPERTOIRE_ACT=$(\pwd)
  repertoire_dgibi=$REPERTOIRE_ACT/"cas_tests_PAP"
  nb_dgibi=$(ll $repertoire_dgibi/*.dgibi | wc -l)
  echo "nbr de dgibi = "$nb_dgibi
  for i in $repertoire_dgibi/*.dgibi ; do
      echo $i
      meld ${i%.dgibi}.res  ${i%.dgibi}"_ref".res ;
  done ;
