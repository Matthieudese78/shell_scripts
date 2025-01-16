#!/bin/bash
# rm *.png
density1='200x200'
for i in ./*.eps ; do 
# ps2pdf $i ${i%.ps}.pdf
# gs -o ${i%.ps}.pdf -sDEVICE=pdfwrite -g8420x5950 -dPDFFitpage $i
convert -density $density1 $i ${i%.eps}.png 
# pdfcrop ${i%.eps}.pdf
# mv ${i%.eps}-crop.pdf ${i%.eps}.pdf
# convert -density $density1 ${i%.ps}.pdf ${i%.ps}.png ;

done
