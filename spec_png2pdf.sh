#!/bin/bash
if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi
echo "argument = ${1}"
for i in $(find . -type d -name "${1}")
  do 
    cd "${i}" || exit
    echo "converting .png 2 .pdf in dir. ${i}"
    ~/shell_scripts/bin/allpng2pdf.sh
    cd - || exit
  done

# while IFS= read -r -d '' dir 
# do 
    # echo "${dir}"
#     # cd "${dir}" || exit
#     # echo "converting .png 2 .pdf in dir. ${dir}"
#     # ~/shell_scripts/allpng2pdf.sh
#     # cd - || exit
# done < <(find . -type d -name "${1}")