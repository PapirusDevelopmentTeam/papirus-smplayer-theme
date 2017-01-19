#!/bin/bash
echo "clear directories"
rm {ePapirus,Papirus,PapirusDark}/*.png

echo "convert icons"
for file in ePapirus/*.svg; do rsvg-convert -f png $file > $file.png; done
for file in Papirus/*.svg; do rsvg-convert -f png $file > $file.png; done
for file in PapirusDark/*.svg; do rsvg-convert -f png $file > $file.png; done
rename 's/\.svg\.png/\.png/g' Papirus/*.png
rename 's/\.svg\.png/\.png/g' ePapirus/*.png
rename 's/\.svg\.png/\.png/g' PapirusDark/*.png

echo "all done"
