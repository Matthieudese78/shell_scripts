#!/bin/bash
### objectif : changer des dimensions de tables definies explicitement / numeriquement sans casser les decla auto * ni les declas avec vairable na1.

# -E : regex avance, ne remplace pas donne juste le resultat en log
# -i : inplace, remplace 
# [^list_of_characters]* : n'importe quel nbr de character qui ne sont pas dans la liste. 
# exemple : [^,\)]* : exclut tous les changement de dimension ou de table

#           ,[[:digit:]]*,|\) : permet de selectionner une dimension definie explicitement (pas par une variable ou une *) et qui est suivie immediatement par un changement de dim , ou de table ).  


# if grep -i "^ *segment[^a-zA-Z]*mtq" "${i}"; then

s1=5
s2=5
s3=5
srot=5
sfmtot=5
sfexb=3

for i in *.eso
 do
  [[ -e "$i" ]] || break # handles the case of no .eso file

# if grep -i "^ *segment[^a-zA-Z]*mtrot" "${i}"; then

echo "rempla omeg1"
sed -Ei "s/(^ *real\*8 .*omeg1\([^,\)]*,)[[:digit:]]*(,|\).*$)/\1${s1}\2/i" "${i}" 

echo "rempla omeg2"                                                   
sed -Ei "s/(^ *real\*8 .*omeg2\([^,\)]*,)[[:digit:]]*(,|\).*$)/\1${s2}\2/i" "${i}" 

echo "rempla omeg3"                                                
sed -Ei "s/(^ *real\*8 .*omeg3\([^,\)]*,)[[:digit:]]*(,|\).*$)/\1${s3}\2/i" "${i}" 

echo "rempla rot"                                                  
sed -Ei "s/(^ *real\*8 .*rot\([^,\)]*,[^,\)]*,)[[:digit:]]*(,|\).*$)/\1${srot}\2/i" "${i}" 

echo "rempla fmomtot"                                                  
sed -Ei "s/(^ *real\*8 .*fmomtot\([^,\)]*,)[[:digit:]]*(,|\).*$)/\1${sfmtot}\2/i" "${i}" 

# fi


echo "rempla q1"
sed -Ei "s/(^ *real\*8 .*q1\([^,\)]*,)[[:digit:]]*(,|\).*$)/\1${s1}\2/i" "${i}" 

echo "rempla q2"                                                   
sed -Ei "s/(^ *real\*8 .*q2\([^,\)]*,)[[:digit:]]*(,|\).*$)/\1${s1}\2/i" "${i}" 

echo "rempla q3"                                                
sed -Ei "s/(^ *real\*8 .*q3\([^,\)]*,)[[:digit:]]*(,|\).*$)/\1${s1}\2/i" "${i}" 

# fi

# on veut le remplacer mm en dehors des segments :

# if grep -i "^ *segment[^a-zA-Z]*mtpas" "${i}"; then

echo "rempla fexb"
sed -Ei "s/(^ *real\*8 .*fexb\([^,\)]*,)[[:digit:]]*(,|\).*$)/\1${sfexb}\2/i" "${i}" 

# fi

done