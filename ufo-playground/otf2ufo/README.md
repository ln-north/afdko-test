# otf2ufo

otfからufoにしてみる

## やりかた

```bash
pip install ufo-extractor
pip install defcon
python3 otf2ufo.py
```

## 資料

- UFOについて
  - https://robofont.com/documentation/introduction/the-ufo-format/
  - http://unifiedfontobject.org/
- 実装
  - https://github.com/robotools/extractor

## 感想

- たしかにufoのほうがttxより読みやすく感じた
  - グリフとフォント設定が別れている
  - グリフのxmlが読みやすい(svgライク)
- `.glif` 拡張子は別に `.glyph` でも良かったのではと思ったりした
- otf => ufoへの変換の仕方は他にもありそう、ひとまず一番最初に見つけた方法でやった