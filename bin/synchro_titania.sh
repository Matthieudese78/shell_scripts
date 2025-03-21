#!/bin/zsh
HOMEDIR="/home/catB/ms264315"
user="ms264315"
repignore="/usr/local/bin"
echo $repignore
rep_sauv_bin="/home/matthieu/Documents/IT/sauv_bin"

# on transfert le user/local/bin dans sauv bin : 
cp -p /usr/local/bin/* $rep_sauv_bin
# repignore="/home/matthieu/Documents/IT/ORCUS/sauvegarde"
# log_ssh="ssh -i ${ORCUS_PATH}/id_rsa ${user}@${log_node}"
# Chmod a distance sur un dir du serveur distant : 
# ssh -i ${ORCUS_PATH}/id_rsa ms264315@orcusloginamd1 "chmod 600 ${HOMEDIR}/sauv_avz"
# Arboresence a sauver : en ssh
# rsync -e ssh /home/matthieu/Documents/Biblio/*.bib ms264315@orcusloginamd1:$HOMEDIR
# || rsync /home/matthieu/.zshrc ms264315@orcusloginamd1:$HOMEDIR

# rsync -r --progress -va --exclude-from "${repignore}/sauvignore.txt" /home/matthieu/Documents ${user}@pegasi3.intra.cea.fr:/home/catB/${user}
# Rq : use pegasi1, pegasi3 or pegasi5
#      ou : ganymede3
rsync -r --progress -va --exclude-from "${repignore}/sauvignore.txt" /home/matthieu/Documents ${user}@pegasi5.intra.cea.fr:/home/catB/${user}

# rsync -r --progress -va --exclude-from "${repignore}/sauvignore.txt" /usr/local/bin ${user}@pegasi1.intra.cea.fr:/home/catB/${user}
