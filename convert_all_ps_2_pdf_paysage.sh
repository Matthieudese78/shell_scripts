#!/bin/bash
# rm *.png
density1='220x220'
# density1='300'
for i in ./*.ps ; do 
# ps2pdf $i ${i%.ps}.pdf
# gs -o ${i%.ps}.pdf -sDEVICE=pdfwrite -g8420x5950 -dPDFFitpage $i
gs -o ${i%.ps}.pdf -sDEVICE=pdfwrite -g5950x8420 -dPDFFitpage $i
# gs -o ${i%.eps}.pdf -sDEVICE=pdfwrite -g8420x5950 -dPDFFitpage $i
# pdfcrop ${i%.ps}.pdf
# mv ${i%.ps}-crop.pdf ${i%.ps}.pdf
# convert -density $density1 ${i%.ps}.pdf ${i%.ps}.png ;
# convert ${i%.ps}.pdf ${i%.ps}.png ;

done
