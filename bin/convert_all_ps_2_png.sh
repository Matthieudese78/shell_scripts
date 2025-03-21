# rm *.png
density1='500x500'
for i in ./*.ps ; do 
# ps2pdf $i ${i%.ps}.pdf
gs -o ${i%.ps}.pdf -sDEVICE=pdfwrite -g8420x5950 -dPDFFitpage $i
# convert -density $density1 $i ${i%.ps}.pdf 
pdfcrop ${i%.ps}.pdf
mv ${i%.ps}-crop.pdf ${i%.ps}.pdf
convert -density $density1 ${i%.ps}.pdf ${i%.ps}.png ;

done
