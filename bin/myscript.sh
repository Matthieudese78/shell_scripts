#!/bin/bash
# qqs parametres utiles : 
SCRIPT="raideur_cercle_cone_loop_orcus.dgibi"
REP_CALC="calcul_orcusS"
REP_CALC_LOC="/home/matthieu/Documents/Cast3M/corps_rigide_castem/fortran/dev_git/rotations_rigides/dgibi_manchette/calcul_raideur/cercle_cone/cercle_cone/calcul_orcus"
REP_CALC_ORC="/home/catB/ms264315/calcul_raideur/cercle_cone"
ORCUS_PATH="/home/matthieu/.ssh/orcus"
HOMEDIR="/home/catB/ms264315"
SCRATCHDIR="/scratch2/catB/ms264315"
user="ms264315"
log_node="orcusloginamd1"
repignore="/usr/local/bin"
# rsync -r --progress -va --exclude-from "${repignore}/sauvignore.txt" /home/matthieu/Documents ${user}@orcusloginamd1:$HOMEDIR
rsync -r --progress -va ${REP_CALC_LOC} ${user}@${log_node}:${SCRATCHDIR}
# Connextion sur orcus :
# ssh -X -i ~/.ssh/id_rsa ${user}@${log_node}:${SCRATCHDIR}
ssh -X -i ~/.ssh/id_rsa ${user}@${log_node}
# on va dans le repertoire des sources
cd ${SCRATCHDIR}/${REP_CALC}
# Module load : 
# module load castem-public castem21
# on compile les sources
# ./do_build
# on passe dans le repertoire dgii_trav
# cd ../dgibi_trav/
# sbatch
# castem21 $SCRIPT > $SCRIPT.res 2>&1

# PROCESSORS LIST :
# amdq_rome
# amdq_naples
# intelq_5118
# intelq_6226
# intelq_6234
sbatch -c 1 -p intelq_6226 myscript.sh $SCRIPT
# A tester :
# sbatch -c 1 -p intelq_6226 -J raideur_Ccone --mail-user=matthieu.Serre@cea.fr --mail-type=begin,end,fail myscript.sh $SCRIPT