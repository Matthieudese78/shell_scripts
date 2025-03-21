#!/bin/bash

######################################################################################
# PRREQUIS pour utiliser ce script:
######################################################################################
# Le marqueur qui précède une ligen que l'on souhaite remplacer est: *#
#  *# DTE :
#  DTE =5.e-8;

# La valeur est définie dans la ligne qui la suit immédiatemment!

# Dans le fichier d'oirigine: on doit sauter une ligen entre la definition de deux valeurs manipulees ici!!

######################################################################################

######################################################################################
# LSITE de PDTs a donner a la main !!
######################################################################################
PDT=(5.e-4 5e-5 5e-6)
length_PDT={${#PDT}
echo "nbr de pas de temps a calculer: " $length_PDT

# Repertoire
repertoire=$(pwd)
echo "repertoire: $repertoire"

# version Windows
windowsversion="64"
annee="21"
executable="cast_${windowsversion}_${annee}"
echo "executable recherche = $executable"
rm $executable
cp -p ../$executable .
echo "executable renouvele"

# CASTEM
castScript="castem${annee}"

# Acquisistion du cas-test
rm *.dgibi
echo "script: ${1%.dgibi}"
cp -p ../$1 .
echo "cas-test importe"

######################################################################################
# Acquisition: RECOTOT
######################################################################################
echo "sortie RECOTOT? (VRAI ou FAUX)"
read RECOTOT
if [ $RECOTOT ] ; then
    echo "RECOTOT = " $RECOTOT
    # Acquisistion du numero de ligne ou NPASe est defini:
   i=$(grep -in "*#.*RECOTOT" $1 | cut -d':' -f1)
   i_RECOTOT=$((i+1))
    # Acquisistion du nom donne au pas de temps dans le script en question:
   name_RECOTOT=$(grep -in1 "*#.*RECOTOT" $1 | grep "=" | sed "s/\*\#/%/g" | cut -d'%' -f2 | cut -d'-' -f2 | cut -d'=' -f1)
   echo "notation pour RECOTOT: ${name_RECOTOT}"
    # On remplace la ligne entiere ou le pas de temps est defini:
   sed -i "${i_RECOTOT}s/.*/${name_RECOTOT}=${RECOTOT}\;/g" $1
   echo "RECOTOT remplacé"
else
   RECOTOT="FAUX"   
   echo "RECOTOT FAUX par défaut" ;
fi

######################################################################################
# Acquisition: EVOLRECO
######################################################################################
echo "sortie EVOLRECO? (VRAI ou FAUX)"
read EVOLRECO
if [ $EVOLRECO ] ; then
    echo "RECOTOT = " $EVOLRECO
    # Acquisistion du numero de ligne ou NPASe est defini:
   i=$(grep -in "*#.*EVOLRECO" $1 | cut -d':' -f1)
   i_EVOLRECO=$((i+1))
    # Acquisistion du nom donne au pas de temps dans le script en question:
   name_EVOLRECO=$(grep -in1 "*#.*EVOLRECO" $1 | grep "=" | sed "s/\*\#/%/g" | cut -d'%' -f2 | cut -d'-' -f2 | cut -d'=' -f1)
   echo "notation pour EVOLRECO: ${name_EVOLRECO}"
    # On remplace la ligne entiere ou le pas de temps est defini:
   sed -i "${i_EVOLRECO}s/.*/${name_EVOLRECO}=${EVOLRECO}\;/g" $1
   echo "EVOLRECO remplacé"
else
   EVOLRECO="VRAI"
   echo "EVOLRECO VRAI par défaut" ;
fi

######################################################################################
# Acquisition: COMPRECO
######################################################################################

# COMPRECO="FAUX"
# if [ $RECOTOT -eq "VRAI" ] && [ $EVOLRECO -eq "VRAI" ] ; then
# echo "sortie COMPRECO? (VRAI ou FAUX)"
# read COMPRECO
#  if [ $COMPRECO ] ; then
#     echo "RECOTOT = " $COMPRECO
#     # Acquisistion du numero de ligne ou NPASe est defini:
#    i=$(grep -in "*#.*COMPRECO" $1 | cut -d':' -f1)
#    i_COMPRECO=$((i+1))
#     # Acquisistion du nom donne au pas de temps dans le script en question:
#    name_COMPRECO=$(grep -in1 "*#.*COMPRECO" $1 | grep "=" | sed "s/\*\#/%/g" | cut -d'%' -f2 | cut -d'-' -f2 | cut -d'=' -f1)
#    echo "notation pour COMPRECO: ${name_COMPRECO}"
#     # On remplace la ligne entiere ou le pas de temps est defini:
#    sed -i "${i_COMPRECO}s/.*/${name_COMPRECO}=${COMPRECO}\;/g" $1
#    echo "COMPRECO remplacé"
#  else
#    COMPRECO="FAUX"
#    echo "COMPRECO FAUX par défaut" ;
#  fi
# else
# COMPRECO="FAUX"
# echo "COMPRECO FAUX par défaut" ;
# fi
######################################################################################
# Acquisition: de NPAse:
######################################################################################
echo "Nombre de pas de temps?"
read NPASe
if [ $NPASe ] ; then
    echo "nbr de pas de temps:" $NPASe
    # Acquisistion du numero de ligne ou NPASe est defini:
   i=$(grep -in "*#.*NPASe" $1 | cut -d':' -f1)
   i_NPASe=$((i+1))
    # Acquisistion du nom donne au pas de temps dans le script en question:
   name_NPASe=$(grep -in1 "*#.*NPASe" $1 | grep "=" | sed "s/\*\#/%/g" | cut -d'%' -f2 | cut -d'-' -f2 | cut -d'=' -f1)
   echo "notation pour NPASe: ${name_NPASe}"
    # On remplace la ligne entiere ou le pas de temps est defini:
   sed -i "${i_NPASe}s/.*/${name_NPASe}=${NPASe}\;/g" $1
   echo "NPASe remplacé"
else
   echo "NPASe non donne" ;
fi

   
######################################################################################
# Acquisistion de la fréquence de sauvegarde NSORT:
######################################################################################
echo "NSORT?"
read NSORT
if [ $NSORT ] ; then
    echo "frequence de sauvegarde:" $NSORT
    # Acquisistion du numero de ligne ou NPASe est defini:
   i=$(grep -in "*#.*NSORT" $1 | cut -d':' -f1)
   i_NSORT=$((i+1))
    # Acquisistion du nom donne au pas de temps dans le script en question:
   name_NSORT=$(grep -in1 "*#.*NSORT" $1 | grep "=" | sed "s/\*\#/%/g" | cut -d'%' -f2 | cut -d'-' -f2 | cut -d'=' -f1)
   echo "notation pour NSORT: ${name_NSORT}"
    # On remplace la ligne entiere ou le pas de temps est defini:
   sed -i "${i_NSORT}s/.*/${name_NSORT}=${NSORT}\;/g" $1
   echo "NSORT remplacé"
else
   echo "NSORT non donne" ;
fi


######################################################################################
# Acquisition du pas de temps / liste de pas de temps: PDT
######################################################################################
# echo "Pas de temps?"
# read PDT
# PDT=(5.e-4 5e-5 5e-6)
# PDT="5.e-3 5e-4 5e-5"
# PDT=5.e-3
if [ $PDT ] ; then
    compteur=0
    for element in "${PDT[@]}"
    do
        compteur=$((compteur+1))
        echo "pas de temps:" $element
        # Acquisistion du numero de ligne ou le PDT est defini:
        i=$(grep -in "*#.*DTe" $1 | cut -d':' -f1)
        i_PDT=$((i+1))
        # Acquisistion du nom donne au pas de temps dans le script en question:
        name_PDT=$(grep -in1 "*#.*DTe" $1 | grep "=" | sed "s/\*\#/%/g" | cut -d'%' -f2 | cut -d'-' -f2 | cut -d'=' -f1)
        echo "notation pour le PDT: ${name_PDT}"
        # On remplace la ligne entiere ou le pas de temps est defini:
        sed -i "${i_PDT}s/.*/${name_PDT}=${element}\;/g" $1
        echo "PDT remplacé"
        
        #CASTEM
        $castScript $1 2> /dev/null
        
        echo "fin execution du cas-test ${1%.dgibi} pour le PDT: ${compteur} / " $length_PDT
    done
else
   echo "PDT non donne" ;
fi



## OLD:
# # PDT=(5.e-4 5.e-5 5.e-6)
# if [ $PDT ] ; then
#    echo "PDT recu = $PDT"
# # Acquisistion du numero de ligne ou le PDT est defini:
#    i=$(grep -in "*#.*DTe" $1 | cut -d':' -f1)
#    i_PDT=$((i+1))
# # Acquisistion du nom donne au pas de temps dans le script en question:
#    name_PDT=$(grep -in1 "*#.*DTe" $1 | grep "=" | sed "s/\*\#/%/g" | cut -d'%' -f2 | cut -d'-' -f2 | cut -d'=' -f1)
#    echo "notation pour le PDT: ${name_PDT}"
# # On remplace la ligne entiere ou le pas de temps est defini:
#    sed -i "${i_PDT}s/.*/${name_PDT}=${PDT}\;/g" $1
#    echo "PDT remplacé"
# else
#    echo "PDT non donne" ;
# fi




## Exemple:
# cp -p ../dy_devo9.dgibi .
# i=$(grep -in "*#.*DTe" dy_devo9.dgibi | cut -d':' -f1)
# i_PDT=$((i+1))
# i_PDT=$((i+1))
# sed -i "${i_PDT}s/.*/DTe=${PDT}\;/g" dy_devo9.dgibi

## Old:
# grep -in1 "*#.*DTe" dy_devo9.dgibi | sed "s/\n/_/g"
# grep -in1 "*#.*DTe" dy_devo9.dgibi | sed "s/\*\#/%/g" | cut -d'%' -f2 |
# grep -in1 "*#.*DTe" dy_devo9.dgibi | sed "s/\*\#/%/g" | cut -d'%' -f2 | cut -d'-' -f1 | sed "s/\n/%/g"
# grep -in1 "*#.*DTe" dy_devo9.dgibi | grep "=" | sed "s/\*\#/%/g" | cut -d'%' -f2 | cut -d'-' -f2 |cut -d'=' -f1
