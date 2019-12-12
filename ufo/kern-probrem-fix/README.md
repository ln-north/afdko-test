# kern-probrem-fix

[latin-font-kerned](./latin-font-kerned) でうまく kern 情報が与えられない問題があり、どう解決したかの過程を書いておく場所

### Roboto を ufo に変換して見てみる

ひとまず、正しくKern情報が与えられてるであろう Roboto を ufo に変換して確認する

[Roboto-Regular](https://github.com/google/fonts/blob/master/apache/roboto/Roboto-Regular.ttf) をダウンロードしてくる

```sh
mkdir Roboto-test
otf2ufo.py Roboto-Regular.otf Roboto-Regular.ufo
```

`kerning.plist` があることを確認、特に `LnNorthRound-Latin-kerned.ufo` の `kerning.plist` の指定が違うということはなさそう

### Roboto の `kerning.plist` を削除して otf に変換

ufo2ft で `kerning.plist` が読み込めてないのではと考えた

試しに　`kerning.plist` を削除して otf に戻してみる

```sh
cp -r ./Roboto-Regular.ufo ./Roboto-Regular-NotKerned.ufo
rm -f ./Roboto-Regular-NotKerned.ufo/kerning.plist
python3 publish.py Roboto-Regular-NotKerned.ufo Roboto-Regular-NotKerned.otf
```

これで　fontView　で開いてみると、kerning がなくなっていそうなことを確認

ufo2ft 自体は `kerning.plist` をちゃんと読むことが分かった

### ttx で見てみる

ひとまず ufo じゃなくとも kerning ができるようにしようと考えた

ufo 以外だと ttx があったので、ttx の kerning の与え方を知るために `Roboto-Regular.otf` と `Roboto-Regular-NotKerned.otf` の diff を見ることにした

```sh
ttx -o Roboto-Regular.ttx Roboto-Regular.otf
ttx -o Roboto-Regular-NotKerned.ttx Roboto-Regular-NotKerned.otf
```

diff を覗いてみた結果、 ttx の GPOS テーブルの　kern feature のところで指定されていることが分かった

```xml
<GPOS>
  <Version value="0x00010000"/>
  <ScriptList>
    <!-- 略 -->
  </ScriptList>
  <FeatureList>
    <FeatureRecord index="1">
    <!-- 略 -->
    </FeatureRecord>
    <FeatureRecord index="1">
      <FeatureTag value="kern"/>
      <Feature>
        <LookupListIndex index="0" value="1"/>
      </Feature>
    </FeatureRecord>
  </FeatureList>
  <LookupList>
    <Lookup index="0">
      <LookupType value="1"/>
      <LookupFlag value="0"/>
      <SinglePos index="0" Format="1">
        <Coverage Format="1">
          <Glyph value="dollar"/>
        </Coverage>
      </SinglePos>
    </Lookup>
    <Lookup index="1">
      <LookupType value="2"/>
      <LookupFlag value="0"/>
      <PairPos index="0" Format="1">
        <Coverage Format="2">
          <Glyph value="dollar"/>
        </Coverage>
      </PairPos>
    </Lookup>
  </LookupList>
</GPOS>
```

`<LookupType>`, `<LookupFlag>`　や、その `value` や `format` の言ってることがわからなかったので [OpenType の GPOS の Spec](https://docs.microsoft.com/ja-jp/typography/opentype/spec/gpos) を調べた

`LookupType` の value は LookupType の 1 ~ 9 で有ることを理解し、今回やりたいのは 2 であることと、その概要を理解した

より日本語で軽く噛み砕いたものとして、以下の記事が役に立った

- [http://aliceinjp.tokyo/2011/03/02/フォントのしくみ2―東京dtpの勉強会/](http://aliceinjp.tokyo/2011/03/02/%E3%83%95%E3%82%A9%E3%83%B3%E3%83%88%E3%81%AE%E3%81%97%E3%81%8F%E3%81%BF2%E2%80%95%E6%9D%B1%E4%BA%ACdtp%E3%81%AE%E5%8B%89%E5%BC%B7%E4%BC%9A/)

ttx に寄り添ったシンプルな説明や書式は、以下の記事が役に立った

- [https://simoncozens.github.io/fonts-and-layout/features.html](https://simoncozens.github.io/fonts-and-layout/features.html)

### LnNorthRound-Latin-Kerned.otf を ttx 経由で作る

LnNorthRound-Kerned-Latin.otf (kernedのついてない失敗作) を ttx へ変換

```sh
ttx -o LnNorthRound-Latin-Kerned_fromTTX.ttx LnNorthRound-Latin-Kerned.otf
```

以下の GPOS テーブルを追加

```xml
<GPOS>
  <Version value="0x00010000"/>
  <ScriptList>
    <!-- 略 -->
  </ScriptList>
  <FeatureList>
    <FeatureRecord index="0">
      <FeatureTag value="kern"/>
      <!-- 略 -->
    </FeatureRecord>
  </FeatureList>
  <LookupList>
    <Lookup index="0">
      <LookupType value="2"/>
      <LookupFlag value="8"/>
      <PairPos index="0" Format="1">
        <Coverage Format="1">
          <Glyph value="cid00071"/>
        </Coverage>
        <ValueFormat1 value="4"/>
        <ValueFormat2 value="0"/>
        <PairSet index="0">
          <PairValueRecord index="0">
            <SecondGlyph value="cid00072"/>
            <Value1 XAdvance="-40"/>
          </PairValueRecord>
        </PairSet>
      </PairPos>
    </Lookup>
  </LookupList>
</GPOS>
```

ttx => oft へ戻す

```
ttx -o LnNorthRound-Latin-Kerned_fromUFO.otf LnNorthRound-Latin-Kerned.ttx
```

FontView でチェックしたところ、無事 kerning がついたものが生成された

### ufo に戻して原因調査

ひとまず kerning がついたので、 ufo でもできるようにするため、これを ufo にもどして確認

```
python3 otf2ufo.py LnNorthRound-Latin-Kerned_fromTTX.otf LnNorthRound-Latin-Kerned_fromTTX.ufo
```

`kerning.plist` を確認すると、以下のようになっていた

```xml
<key>uni0066</key>
<dict>
  <key>uni0067</key>
  <integer>-40</integer>
</dict>
```

ttx では cid で指定していたが、 unicode に変わっている

もしかして、kerning.plist の名前は `glyph/*.glif` の　glyph 要素の name 属性を参照しているのかもと考え、 glif ファイルの glyph 要素の name 属性を cid に変更

=> [latin-font-kerned](./latin-font-kerned) で成功

これを再び、 otf => ttx に変換し、 GPOS テーブルが有ることを確認

## 感想

- 解決してよかった
- ttx を扱ううちに、扱い方やテーブルの内容と OpenType の Spec の対応のさせ方が分かるようになってきた
- 世にあるフォントの説明のうち、「テーブル」というのは ttx のファイルの概念を含んでいそうということがわかった
  - ufo はわかりやすいファイル構成だが、この「テーブル」という説明がちょっとしっくりこなくなる(説明の互換性が薄い)
  - どちらもある程度触れるようになっているのが好ましいが、 ufo のほうがモダンな構成だと思った