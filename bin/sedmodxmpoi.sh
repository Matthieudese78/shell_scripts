#!/bin/bash
### objectif : rajouter l'energie potentiel dans mtrot.

# -E : regex avance, ne remplace pas donne juste le resultat en log
# -i : inplace, remplace 

for i in *.eso
 do
  [[ -e "$i" ]] || break # handles the case of no .eso file

echo "rajout mtot"
sed -Ei "s/(^ *real\*8.*xmpoi)\(.*\)(.*)/\1(NPDEF,NSB)\2/i" "${i}" | grep -i2 "real.*8.*xmpoi.*npdef"

grep -i2 "real.*8.*xmpoi.*npdef.*nsb" *.eso
# si on veut just observer, virer le i de -Ei et piper :
# | grep -i2 "real.*8.*skl.*ikl"
  done
