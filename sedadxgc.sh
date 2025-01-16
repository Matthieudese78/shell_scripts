#!/bin/bash
### objectif : rajouter l'energie potentiel dans mtrot.

# -E : regex avance, ne remplace pas donne juste le resultat en log
# -i : inplace, remplace 

for i in *.eso
 do
  [[ -e "$i" ]] || break # handles the case of no .eso file

echo "rajout epot(isb)"
sed -Ei "s/(^ *real\*8 .*epot\(nsb\))/\1,XGC(3,NSB)/i" "${i}" 

  done
