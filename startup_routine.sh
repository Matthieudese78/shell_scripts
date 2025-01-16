#!/usr/bin/zsh
# T en TT :
echo "T'es en TT (y or n)?"
read TT
echo "reponse = $TT"

if [ $TT ] && [[ $TT == 'y' ]] ; then 
  echo "ouverture VPN ..."
  gnome-terminal -- sudo fortisslvpn &  
  sleep 30.
  echo "ouverture SIGMA ..."
  google-chrome https://espacesigma.cea.fr/portail/ >/dev/null &
  sleep 0.5
  echo "Bonne journée !!! Ne fume pas (trop)."
else
   echo "Bonne journée au DYN ! Ne fume pas (trop)."
fi
# MAIL intra : 
echo "thunderbird ... "
thunderbird  >/dev/null &
sleep 0.5
echo "webmail CEA ..."
firefox mail.intra.cea.fr >/dev/null &
sleep 0.5

# if [ $TT ] &&  ($TT == "y") ; then 
#    echo "ouverture SIGMA" ; sleep 0.5
#    google-chrome https://espacesigma.cea.fr/portail/ &
# else
#    echo "pas de SIGMA"
# fi
