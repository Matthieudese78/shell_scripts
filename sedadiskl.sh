#!/bin/bash
### objectif : rajouter l'energie potentiel dans mtrot.

# -E : regex avance, ne remplace pas donne juste le resultat en log
# -i : inplace, remplace 

for i in *.eso
 do
  [[ -e "$i" ]] || break # handles the case of no .eso file

echo "rajout mtot"
sed -Ei "s/(^ *real\*8)(.*mtot\(ntot,ntot,nsb\))/\1\2\n\1 SKL(3,3,NA2,NA2,NSB),IKL(3,3,NA2,NSB)/i" "${i}" 

grep -i2 "real.*8.*skl.*ikl"

# si on veut just observer, virer le i de -Ei et piper :
# | grep -i2 "real.*8.*skl.*ikl"
  done
