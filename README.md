# font-engineering-playground

これはフォントエンジニアリングに関する技術検証とかあれこれを試すリポジトリです

## やったこと

- afdko
  - [margefontsを使う](./afdko/margefonts/)
  - [makeotfを使う](./afdko/makeotf/)
  - [txでのグリフ一覧pdf出力](./afdko/tx-pdf/)
  - [rotatefontを使う](./afdko/rotatefont/)
  - [ttxを出力してみる](./afdko/ttx/)
- ufo
  - [otfからufoへ変換](./ufo/otf2ufo/)
  - [svgをufo経由でotfにする](./ufo/svg2otf-via-ufo/)
  - [latinフォントを作る](./ufo/latin-font/)
  - [カーニングをつける](./ufo/latin-font-kerned/)
    - [最初うまくつけられなかったのでその調査と解決までの記録](./ufo/kern-probrem-fix/)

## やってみたいこと

- [x] svg => ufo => otfで欧文フォントを作ってみたい
- [ ] メトリクスについて理解する
- [ ] OpenTypeのfeaturesについていろいろ作ってみたい
  - [ ] GSUB(リガチャ)
  - [ ] GSUB(縦書き)
  - [x] GPOS(ハイフンとか)
- [ ] バリアブルフォントを作ってみたい
- [ ] カラー絵文字を作ってみたい
- [x] fonttools(≒ttx?)を使ってみたい
 
## キーワード

- [AFDKO](https://github.com/adobe-type-tools/afdko) 
- [UFO](http://unifiedfontobject.org/)
