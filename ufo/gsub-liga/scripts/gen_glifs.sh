#!/bin/bash

# svg2glif.pyを利用してsvgからglifデータを作る

# USAGE
# ./gen_glifs.sh {svgDir} {ufoDir}

svgDir=$1
ufoDir=$2

filenames=($(ls ${svgDir} | xargs -I %% basename %% .svg))

for filename in ${filenames[@]}; do
  width=($(cat ${svgDir}/${filename}.svg | awk '{print $5}'))
  height=($(cat ${svgDir}/${filename}.svg | awk '{print $6}' | awk -F '"' '{print $1}'))
  python3 ./scripts/svg2glif.py \
    ${svgDir}/${filename}.svg \
    ${ufoDir}/glyphs/uni${filename}.glif \
    -n uni${filename} \
    -w ${width} \
    -H ${height} \
    -u ${filename} \
    -t "1 0 0 -1 0 720"
  echo "generated uni${filename}.glif"
done