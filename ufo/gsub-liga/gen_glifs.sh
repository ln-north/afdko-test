#!/bin/bash
svgDir="./original-svg"
ufoDir="./LnLatinLiga-Light.ufo"

filenames=($(ls ${svgDir} | xargs -I %% basename %% .svg))

for filename in ${filenames[@]}; do
  width=($(cat ${svgDir}/${filename}.svg | awk '{print $5}'))
  height=($(cat ${svgDir}/${filename}.svg | awk '{print $6}' | awk -F '"' '{print $1}'))
  python3 ./svg2glif.py \
          ${svgDir}/${filename}.svg \
          ${ufoDir}/glyphs/${filename}.glif \
          -w ${width} \
          -H ${height} \
          -t "1 0 0 -1 0 720"
done