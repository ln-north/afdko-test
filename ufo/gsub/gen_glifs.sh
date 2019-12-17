#!/bin/bash

# TODO: 後で引数を取れるようにする
# $1: svgのあるディレクトリ
# $2: ufoのglpyhsファイルのディレクトリ

filenames=($(ls ./original-svg/ | xargs -I %% basename %% .svg))

# TODO: svgからwidth/height情報を取る <= filenamesのsvgからviewboxをみる

# width
# height

for filename in ${filenames[@]}; do
  #TODO: -w -h に指定する
  python3 ./svg2glif.py \
          original-svg/${filename}.svg \
          LnLatinLiga-Light.ufo/glyphs/${filename}.glif \
          -w ${width[index]} \
          -h ${height[index]} \
          -t "1 0 0 -1 0 720"
done