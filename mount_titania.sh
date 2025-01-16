#!/bin/bash
user="ms264315"
# Rq : use pegasi1, pegasi3 or pegasi5
#      ou : ganymede3
sshfs -o Compression=no,allow_other,IdentityFile=home/${user}/.ssh/id_ed264315 ${user}@ganymede3.intra.cea.fr:/home/catB/${user} ~/titania

# rem : pour demonter, il suffit de faire :
echo "pour demonter   : $ fusermount -u /titania"
echo "si FAILED faire : $ sudo mount -l /titania"

#  pour tester le montage on peut faire :
# $ if  mountpoint -q /titania > /dev/null ; then ...; else ...; fi;

echo "Montage de castem-public (o/N) ?"
read go
if [ $go == "o" ]; then 
   sshfs -o Compression=no,allow_other,IdentityFile=home/${user}/.ssh/id_ed264315 ${user}@pegasi1.intra.cea.fr://home/castem-public /home/matthieu/castem-public
fi

echo "Montage de manta (o/N) ?"
read go
if [ $go == "o" ]; then 
   sshfs -o Compression=no,allow_other,IdentityFile=home/${user}/.ssh/id_ed264315 ${user}@pegasi1.intra.cea.fr://home/manta /home/matthieu/manta
fi
