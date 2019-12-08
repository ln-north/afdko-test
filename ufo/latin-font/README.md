# latin-font

メトリクス（幅）の異なるフォントを作りたい、一番馴染み深いlatin文字を作る

ひとまずオリジナルで作った「a」~「g」の文字を含むフォントを作る

## やりかた

### svg => ufo

グリフとなるsvgアウトラインデータを作成

```
python3 ./svg2glif.py original-svg/uni0061.svg LnNorthRound-Latin-Light.ufo/glyphs/cid00066.glif -w 495 -H 1000 -u "0061" -t "1 0 0 -1 0 720"
python3 ./svg2glif.py original-svg/uni0062.svg LnNorthRound-Latin-Light.ufo/glyphs/cid00067.glif -w 485 -H 1000 -u "0062" -t "1 0 0 -1 0 720"
python3 ./svg2glif.py original-svg/uni0063.svg LnNorthRound-Latin-Light.ufo/glyphs/cid00068.glif -w 487 -H 1000 -u "0063" -t "1 0 0 -1 0 720"
python3 ./svg2glif.py original-svg/uni0064.svg LnNorthRound-Latin-Light.ufo/glyphs/cid00069.glif -w 486 -H 1000 -u "0064" -t "1 0 0 -1 0 720"
python3 ./svg2glif.py original-svg/uni0065.svg LnNorthRound-Latin-Light.ufo/glyphs/cid00070.glif -w 500 -H 1000 -u "0065" -t "1 0 0 -1 0 720"
python3 ./svg2glif.py original-svg/uni0066.svg LnNorthRound-Latin-Light.ufo/glyphs/cid00071.glif -w 373 -H 1000 -u "0066" -t "1 0 0 -1 0 720"
python3 ./svg2glif.py original-svg/uni0067.svg LnNorthRound-Latin-Light.ufo/glyphs/cid00072.glif -w 474 -H 1000 -u "0067" -t "1 0 0 -1 0 720"
```

```
cp ../ufo2ft/AFDKOSample-Light_min.ufo/*.plist ./LnNorthRound-Light.ufo/
cp ../ufo2ft/AFDKOSample-Light_min.ufo/glyphs/contents.plist ./LnNorthRound-Light.ufo/glyphs/
cp ../ufo2ft/AFDKOSample-Light_min.ufo/glyphs/_nodef.glif ./LnNorthRound-Light.ufo/glyphs/
```

### ufo => otf

[ufo2ft](https://github.com/googlefonts/ufo2ft) でOTFを作る

```
python3 publish.py
```

## 資料

- cid表
  - https://www.adobe.com/content/dam/acom/en/devnet/font/pdfs/5078.Adobe-Japan1-6.pdf
- UFO仕様
  - http://unifiedfontobject.org/versions/ufo3/glyphs/glif/#advance

## 感想

- glifのメトリクスが各文字で違う場合は、`<advanced>`で定義すれば良い。
  - 参考にRoboto-Regular.otfを見てみたら、latin文字はwidthだけ指定してあった。
  - ついでにいろいろ見たところ、acuteなどの記号の定義はa.glifにあるわけではなく、aacute.glifという感じで定義してあり、 `<component base="a"/>`, `<component base="acute" xOffset="356"/>` というように `<component>` と `(x|y)Offset` で定義してあった。なるほど。
- ここから日本語を追加していく、となると、どうメトリクス、特に仮想ボディのサイズを組み立てていくか結構考える必要があって、意外とコンピューターになっても活字の概念はかなり引っ張ってるんだと実装して初めて実感した。
  - 現在の観測範囲では、そもそも仮想ボディと言っているドキュメントはなかったように見える、日本限定？
- svg2glif.py の ufoLib はいらなさそうということが分かった。fonttoolsの中に入っているので、改めてインストールしようとすると依存関係で引っかかってしまう。
  - この解消には `__requires__ = ["FontTools", "ufoLib"]` の `ufoLib` を削除すれば良い。気づいたらPRを出しておきたい。
- 実はAdobeのcidの対応表の読み方の謎解きが微妙だったが、ようやくちゃんと読めるようになった（足し算だった）
