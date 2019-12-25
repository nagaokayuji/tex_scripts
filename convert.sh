#!/bin/sh

# epsをpdfに変換
# pdfはcropする．

for i in $(ls ./figures/*.eps); do
echo "epstopdf $i"
epstopdf $i
mv $i ./figures/eps_backup
done

for i in $(ls ./figures/*.png); do
j=`echo $i | sed -e "s/png$/pdf/"`
echo "convert $i $j"
convert $i $j
mv $i ./figures/png_backup
done

for i in $(ls ./figures/*.pdf); do 
pdfcrop --margin 20 $i $i
done