#!/bin/bash
# rm *.pdf
density1='220x220'
for i in ./*.png ; do 
# ps2pdf $i ${i%.ps}.pdf
# gs -o ${i%.ps}.pdf -sDEVICE=pdfwrite -g8420x5950 -dPDFFitpage $i
convert -density $density1 $i ${i%.png}.pdf 
# pdfcrop ${i%.eps}.pdf
# mv ${i%.eps}-crop.pdf ${i%.eps}.pdf
# convert -density $density1 ${i%.ps}.pdf ${i%.ps}.png ;

done
