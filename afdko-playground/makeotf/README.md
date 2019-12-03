# makeotf

[margefonts](../margefonts/README.md) で作った marged.raw から OpenType Font を作る

## やりかた

### featuresファイル(今回は空)で吐き出す

```
makeotf -f marged.raw -ff features_min -o AFDKOSample-Light_min.otf
```

### フォント名つきで吐き出す

```
makeotf -f marged.raw -ff features_min -mf fontMenuNameDB -o AFDKOSample-Light_named.otf
```

## 資料

- 実装
  - https://shiromoji.hatenablog.jp/entry/20111206/1323270030
- featuresの仕様
  - https://adobe-type-tools.github.io/afdko/OpenTypeFeatureFileSpecification.html
- fontMenuNameDB
  - https://docs.microsoft.com/ja-jp/typography/opentype/spec/name

## 感想

