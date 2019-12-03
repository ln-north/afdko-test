# font-engineering-playground

これはフォントエンジニアリングに関する技術検証とかあれこれを試すリポジトリです

## やったこと

- afdko
  - [margefonts](./margefonts/README.md)
  - [makeotf](./makeotf/README.md)
  - [txでのグリフ一覧pdf出力](./tx-pdf/README.md)
  - [rotatefont](./rotatefont/README.md)
  - [ttxで.ttxを吐き出してみる](./ttx/README.md)
- ufo
  - [otf2ufo](./otf2ufo/README.md)
  - [svgをufo経由でotfにする(svg2otf-via-ufo)](./svg2otf-via-ufo/README.md)

## やってみたいこと

- [ ] svg => ufo => otfで欧文フォントを作ってみたい
- [ ] メトリクスについて理解する
- [ ] OpenTypeのfeaturesについていろいろ作ってみたい
  - [ ] GSUB(リガチャ)
  - [ ] GSUB(縦書き)
  - [ ] GPOS(ハイフンとか)
  - その他いろいろ…
- [ ] バリアブルフォントを作ってみたい
- [ ] カラー絵文字を作ってみたい
- [ ] fonttools(≒ttx?)を使ってみたい
- [ ] svg => ttx => otf を作ってみたい
 
## キーワード

- [AFDKO](https://github.com/adobe-type-tools/afdko) 
- [UFO](http://unifiedfontobject.org/)
