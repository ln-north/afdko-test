# latin-font

メトリクス（幅）の異なるフォントを作りたい、一番馴染み深いlatin文字を作る

ひとまずオリジナルで作った「a」~「g」の文字を含むフォントを作る

## やりかた

## kerning.plist

- `kerning.plist` を編集して kerning 情報を付与する




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

