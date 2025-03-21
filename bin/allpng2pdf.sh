#!/bin/bash
density1='220x220'

### old :
# for i in $(find . -name "*.png")
#   do convert -density $density1 $i ${i%.png}.pdf
# done

### ShellCheck :
while IFS= read -r -d '' file
do
  (( count++ ))
  echo "Converting .png no. $count"
  # echo "$file"
  convert -density $density1 "${file}" "${file%.png}.pdf"
done <   <(find ./ -mtime -7 -name '*.png' -print0)
echo "Converted $count files"

### Guillaume :
# {} is replaced by filename in the find command
# '\;' is necessary for find to end the command. ';' is not adapted because it would be interpreted by the shell
  # V1 --> broken
# find . -name '*.png' -exec convert -density "${density1}" '{}' "$(basename -s '.png' '{}').pdf" \; 
  # V2 : en executant une commande shell (en -c "canonical") 
      # {} est l'argument de la commande shell et est stocke sous $0
      # commande test (marche):
# find . -name '*.png' -exec sh -c 'newfilename=$(basename -s .png $0).pdf; echo $newfilename' {} \;
      # commande convert : marche pas
# find . -name '*.png' -exec sh -c 'newfilename=$(basename -s .png $0).pdf; convert -density ${density1} $0 $newfilename' {} \;

# broken
# find . -name '*.png' -exec echo ${'{}'%.png}.pdf \; 

