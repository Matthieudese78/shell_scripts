#!/bin/bash
### objectif : rajouter l'energie potentiel dans mtrot.

# -E : regex avance, ne remplace pas donne juste le resultat en log
# -i : inplace, remplace 

for i in *.eso
 do
  [[ -e "$i" ]] || break # handles the case of no .eso file

echo "rajout mtot"
sed -Ei "s/(^ *real\*8 .*mfr\(na2,3,nsb\))/\1,MTOT(NTOT,NTOT,NSB)/i" "${i}" 

  done
