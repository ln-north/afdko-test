# latin-font-kerned

[latin-font](./latin-font) で作ったフォントの f-(a|c|d|e|g) 間が気になるので kern 情報を付与する


## やりかた

### 1. kerning.plist

`kerning.plist` を編集して kerning 情報を付与する

```xml
<key>cid00071</key>
<dict>
  <key>cid00072</key>
  <integer>-40</integer>
</dict>
```

編集したら otf として publish

```sh
python3 publish.py LnNorthRound-Latin-Kerned-Light.ufo LnNorthRound-Latin-Kerned-Light.otf
```

### 2. groups.plist 

`groups.plist` を編集してまとめたい group の key を定める

group の key は制約があることに注意する

- カーニングペアの1文字目に当たるときは `public.kern1.` prefix
- カーニングペアの2文字目に当たるときは `public.kern2.` prefix

他にもあるが、詳しくは groups.plist の spec を見る

```xml
<key>public.kern2.cid00066</key>
<array>
  <string>cid00066</string>
  <string>cid00068</string>
  <string>cid00069</string>
  <string>cid00070</string>
  <string>cid00072</string>
</array>
```

定めた group の key を利用して　`kerning.plist` で kerning を指定する

```xml
<key>cid00071</key>
<dict>
  <key>public.kern2.cid00066</key>
  <integer>-50</integer>
</dict>
```

編集したら otf として publish

```sh
python3 publish.py LnNorthRound-Latin-Kerned-Light.ufo LnNorthRound-Latin-Kerned-Light.otf
```

## 資料

- UFO仕様
  - http://unifiedfontobject.org/versions/ufo3/kerning.plist/
  - http://unifiedfontobject.org/versions/ufo3/groups.plist/

## 感想

- glif ファイルの glyph 要素の name 属性を lib.plist と一致させないと kerning 情報を与えられないということの調査に時間がかかった
  - [いろいろ調査・試行錯誤する過程](./kerned-probrem-fix/) で `ttx` のテーブルの扱いが少し身についたのでよかった
  - 今回も otf を publish したあと、 ttx にして GPOS テーブルがあるかで kerning があるか確認していた
- groups.plist の命名規則も kerning.plist と対応さえしてればいいだろうと思ったらちゃんと守らないとだめなところで一瞬ハマった、仕様ちゃんと読めばきちんと書いてあった
- publish するのに毎回ファイル開くのが面倒だったので、引数で指定するようにした
