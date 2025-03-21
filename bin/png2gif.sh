# conversion png (issu de paraview) -> gif anime
# utilisation png2gif.sh fichier.0123.png
i1=${1%_*}                  # filename without extension
i2=${i1%_*}                 # filename without paraview numeration
# on commence par enlever la derniere frame (= la premiere si periodique)
i3=$(ls -1 $i2.*.png | tail -1)
mv $i3 $i3.inutile
# on effectue la conversion proprement dite
echo "creation de $i2.gif ..."
convert $i2.*.png $i2-tmp.gif
gifsicle --loopcount --delay 3 --careful -O2 $i2-tmp.gif > $i2.gif
rm -f $i2-tmp.gif
convert -delay 4 -loop 0 *.jpeg myimage.gif
convert -delay 1 -loop 0 *.png  myimage.gif
