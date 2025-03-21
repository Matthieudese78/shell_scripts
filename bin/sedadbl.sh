#!/bin/bash
### objectif : rajouter l'energie potentiel dans mtrot.

# -E : regex avance, ne remplace pas donne juste le resultat en log
# -i : inplace, remplace 

for i in *.eso
 do
  [[ -e "$i" ]] || break # handles the case of no .eso file

echo "rajout mtot"
sed -Ei "s/(^ *real\*8)(.*ikl\(3,3,na2,nsb\))/\1\2\n\1 BL0(3,NSB),BLF(3,NA2,NSB)/i" "${i}" 

grep -i2 "real.*8.*BL0.*BLF" "${i}"

# si on veut just observer, virer le i de -Ei et piper :
# | grep -i2 "real.*8.*skl.*ikl"
  done
