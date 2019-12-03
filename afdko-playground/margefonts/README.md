# margefonts

mplus-1p-light.otf からひらがな、mplus-1p-medium.otf からカタカナのグリフを取り出した marged.raw を作成する

## やりかた

```
margefonts -cid cidfontinfo marged.raw hiragana.map mplus-1p-light.otf katakana.map mplus-1p-medium.otf
```

`([mapファイル] [素材フォント名])+` でいくつものフォントを統合できる。書き出したフォント情報は cidfontinfo に記述する

### フォント名つきで吐き出す

```
makeotf -f marged.raw -ff features_min -mf fontMenuNameDB -o AFDKOSample-Light_named.otf
```

## 資料

- 実装
  - https://shiromoji.hatenablog.jp/entry/20111210/1323520587
- cidfontinfoの仕様
  - http://blogs.adobe.com/CCJKType/2011/08/cidfontinfo.html

## 感想

