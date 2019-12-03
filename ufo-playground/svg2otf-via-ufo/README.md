# svg2ufo

svgからufoを生成する

ひとまずオリジナルで作った「あ」「い」「う」の文字を含むフォントを作る

## やりかた

### svg => ufo

グリフとなるsvgアウトラインデータを作成

```
pip install fonttools
pip install ufoLib
python3 ./svg2glif.py original-svg/uni3042.svg LnNorthRound-Light.ufo/glyphs/cid00843.glif -w 1000 -H 1000 -u "3042" -t "1 0 0 -1 0 1000"
python3 ./svg2glif.py original-svg/uni3044.svg LnNorthRound-Light.ufo/glyphs/cid00845.glif -w 1000 -H 1000 -u "3044" -t "1 0 0 -1 0 1000"
python3 ./svg2glif.py original-svg/uni3046.svg LnNorthRound-Light.ufo/glyphs/cid00847.glif -w 1000 -H 1000 -u "3046" -t "1 0 0 -1 0 1000"
```

[ln-north/font-engineering-playground/ufo2ft](https://github.com/ln-north/font-engineering-playground/tree/master/ufo-playground/ufo2ft) の吐き出した ufo を見ながら、 `ufo/` に

- fontinfo.plist
- layercontents.plist
- lib.plist
- metainfo.plist
- glyphs/contents.plist
- glyphs/_notdef.glif

を以下のようにして作成し、UFOのSpecを見ながら編集。

```
cp ../ufo2ft/AFDKOSample-Light_min.ufo/*.plist ./LnNorthRound-Light.ufo/
cp ../ufo2ft/AFDKOSample-Light_min.ufo/glyphs/contents.plist ./LnNorthRound-Light.ufo/glyphs/
cp ../ufo2ft/AFDKOSample-Light_min.ufo/glyphs/_nodef.glif ./LnNorthRound-Light.ufo/glyphs/
```

### ufo => otf

[ufo2ft](https://github.com/googlefonts/ufo2ft) でOTFを作る

```
pip install defcon
pip install ufo2ft
python3 publish.py
```

## 資料

- 実装
  - https://github.com/fonttools/fonttools/blob/e13fca3449db678c47915f96913f71c5bdb60f73/Snippets/svg2glif.py
- Unicode対応表
  - https://0g0.org/category/3040-309F/1/
- Unicode CIDの対応表
  - https://www.adobe.com/content/dam/acom/en/devnet/font/pdfs/5078.Adobe-Japan1-6.pdf
- UFO仕様
  - http://unifiedfontobject.org/versions/ufo3/fontinfo.plist/
  - http://unifiedfontobject.org/versions/ufo3/layercontents.plist/
  - http://unifiedfontobject.org/versions/ufo3/lib.plist/
  - http://unifiedfontobject.org/versions/ufo3/metainfo.plist/
  - http://unifiedfontobject.org/versions/ufo3/glyphs/contents.plist/

## 感想

- svg2ufoの中身はあまり覗けていないが見てみたい
- 今回はufoの作成がメインだったので、fontinfoのメトリクス設定はもう少しちゃんとOpenType仕様と合わせて見る必要がありそう
- ufoとsvgはyの座標系が逆
  - yを反転してheight分y方向にoffsetした
  - 本当に合っているかメトリクスについてより深い理解が必要そう
- pythonはmodule名とファイル名が同名だとファイルを先に読みに行ってしまってmoduleまで読みに行けない(ハマった)