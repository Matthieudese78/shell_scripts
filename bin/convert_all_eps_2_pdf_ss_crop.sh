#!/bin/bash
density1='220x220'
for i in ./*.eps ; do 
# ps2pdf $i ${i%.ps}.pdf
# gs -o ${i%.ps}.pdf -sDEVICE=pdfwrite -g8420x5950 -dPDFFitpage $i
gs -o ${i%.eps}.pdf -sDEVICE=pdfwrite -g8420x5950 -dPDFFitpage $i
# pdfcrop ${i%.ps}.pdf
# mv ${i%.ps}-crop.pdf ${i%.ps}.pdf
convert -density $density1 ${i%.eps}.pdf ${i%.eps}.png ;

done
