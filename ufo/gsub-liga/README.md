# gsub-liga

「ff」と「fi」のリガチャ情報を含むフォントを作成する

## やりかた

### svg から ufo の準備まで

ufo ファイルから otf の publish までを自動化したので各スクリプトを実行

```sh
# ufoのファイル一式を生成
sh ./scripts/init.sh LnLiga
# svg => glif ファイル生成
sh ./scripts/gen_glifs.sh ./original-svg ./LnLiga.ufo
# glyphs/ にある .glif ファイル群から lib.plist と glpyhs/contents.plist の内容を生成
sh ./scripts/gen_glyphinfo.sh ./LnLiga.ufo
```

### features.plist に liga 情報を追加

AFDKO の syntax に従っている

```
feature liga {
  sub uni0066 uni0066 by uniFB00;
  sub uni0066 uni0069 by uniFB01;
} liga;
```

### kern 情報追加

groups.plist

```xml
<key>public.kern1.uni0066</key>
<array>
  <string>uni0066</string>
  <string>uniFB00</string>
</array>
<key>public.kern1.uni0069</key>
<array>
  <string>uni0069</string>
  <string>uniFB01</string>
</array>
<key>public.kern2.uni0061</key>
<array>
  <string>uni0061</string>
  <string>uni0063</string>
  <string>uni0064</string>
  <string>uni0065</string>
  <string>uni0067</string>
</array>
```

kerning.plist

```xml
<key>public.kern1.uni0066</key>
<dict>
  <key>public.kern2.uni0061</key>
  <integer>-60</integer>
</dict>
<key>public.kern1.uni0069</key>
<dict>
  <key>public.kern2.uni0061</key>
  <integer>-20</integer>
</dict>
```

### otf を publish

```sh
python3 ./scripts/publish.py ./LnLiga.ufo ./LnLiga.otf
```

## 資料

- UFO 仕様
  - http://unifiedfontobject.org/versions/ufo3/features.fea/
- AFDKO の features ファイルの syntax と仕様
  - https://adobe-type-tools.github.io/afdko/OpenTypeFeatureFileSpecification.html

## 感想

