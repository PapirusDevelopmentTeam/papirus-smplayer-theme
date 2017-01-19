#!/bin/bash
echo "convert ePapirus"
cd ePapirus
rm *.png
for file in *.svg; do inkscape $file --without-gui --export-png=$file.png; done
rename 's/\.svg\.png/\.png/g' *.png
cd ..

echo "convert Papirus"
cd Papirus
rm *.png
for file in *.svg; do inkscape $file --without-gui --export-png=$file.png; done
rename 's/\.svg\.png/\.png/g' *.png
cd ..

echo "convert PapirusDark"
cd PapirusDark
rm *.png
for file in *.svg; do inkscape $file --without-gui --export-png=$file.png; done
rename 's/\.svg\.png/\.png/g' *.png
cd ..
echo "done"
