#!/bin/zsh
ORCUS_PATH="/home/matthieu/.ssh/orcus"
HOMEDIR="/home/catB/ms264315"
user="ms264315"
log_node="orcusloginamd1"
repignore="/usr/local/bin"
echo $repignore
# repignore="/home/matthieu/Documents/IT/ORCUS/sauvegarde"
# log_ssh="ssh -i ${ORCUS_PATH}/id_rsa ${user}@${log_node}"
# Chmod a distance sur un dir du serveur distant : 
# ssh -i ${ORCUS_PATH}/id_rsa ms264315@orcusloginamd1 "chmod 600 ${HOMEDIR}/sauv_avz"
# Arboresence a sauver : en ssh
# rsync -e ssh /home/matthieu/Documents/Biblio/*.bib ms264315@orcusloginamd1:$HOMEDIR

rsync -r --progress -va --exclude-from "${repignore}/sauvignore.txt" /home/matthieu/Documents ${user}@orcusloginamd1:$HOMEDIR 
# || rsync /home/matthieu/.zshrc ms264315@orcusloginamd1:$HOMEDIR
