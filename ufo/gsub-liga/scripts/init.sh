#!/bin/bash

# ufoの初期ファイルを作る

# USAGE
# ./init.sh {fontname}

fontname=$1

mkdir ${fontname}.ufo/
touch ${fontname}.ufo/features.fea \
      ${fontname}.ufo/fontinfo.plist \
      ${fontname}.ufo/groups.plist \
      ${fontname}.ufo/kerning.plist \
      ${fontname}.ufo/layercontents.plist \
      ${fontname}.ufo/lib.plist \
      ${fontname}.ufo/metainfo.plist
mkdir ${fontname}.ufo/glyphs
touch ${fontname}.ufo/glyphs/contents.plist
touch ${fontname}.ufo/glyphs/_nodef.glif

# fontinfo.plist
cat <<EOF > ${fontname}.ufo/fontinfo.plist
<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>ascender</key>
    <integer>720</integer>
    <key>capHeight</key>
    <integer>0</integer>
    <key>descender</key>
    <integer>-280</integer>
    <key>familyName</key>
    <string>${fontname}</string>
    <key>guidelines</key>
    <array/>
    <key>italicAngle</key>
    <real>0.0</real>
    <key>openTypeHeadCreated</key>
    <string>2019/12/10 08:27:00</string>
    <key>openTypeHeadFlags</key>
    <array>
      <integer>0</integer>
      <integer>1</integer>
    </array>
    <key>openTypeHeadLowestRecPPEM</key>
    <integer>3</integer>
    <key>openTypeHheaAscender</key>
    <integer>720</integer>
    <key>openTypeHheaCaretOffset</key>
    <integer>0</integer>
    <key>openTypeHheaCaretSlopeRise</key>
    <integer>1</integer>
    <key>openTypeHheaCaretSlopeRun</key>
    <integer>0</integer>
    <key>openTypeHheaDescender</key>
    <integer>-280</integer>
    <key>openTypeHheaLineGap</key>
    <integer>1000</integer>
    <key>openTypeNamePreferredSubfamilyName</key>
    <string>Regular</string>
    <key>openTypeNameRecords</key>
    <array>
      <dict>
        <key>encodingID</key>
        <integer>0</integer>
        <key>languageID</key>
        <integer>0</integer>
        <key>nameID</key>
        <integer>1</integer>
        <key>platformID</key>
        <integer>1</integer>
        <key>string</key>
        <string>${fontname}</string>
      </dict>
      <dict>
        <key>encodingID</key>
        <integer>1</integer>
        <key>languageID</key>
        <integer>1033</integer>
        <key>nameID</key>
        <integer>1</integer>
        <key>platformID</key>
        <integer>3</integer>
        <key>string</key>
        <string>${fontname}</string>
      </dict>
      <dict>
        <key>encodingID</key>
        <integer>0</integer>
        <key>languageID</key>
        <integer>0</integer>
        <key>nameID</key>
        <integer>2</integer>
        <key>platformID</key>
        <integer>1</integer>
        <key>string</key>
        <string>Regular</string>
      </dict>
      <dict>
        <key>encodingID</key>
        <integer>1</integer>
        <key>languageID</key>
        <integer>1033</integer>
        <key>nameID</key>
        <integer>2</integer>
        <key>platformID</key>
        <integer>3</integer>
        <key>string</key>
        <string>Regular</string>
      </dict>
      <dict>
        <key>encodingID</key>
        <integer>0</integer>
        <key>languageID</key>
        <integer>0</integer>
        <key>nameID</key>
        <integer>3</integer>
        <key>platformID</key>
        <integer>1</integer>
        <key>string</key>
        <string>1.000;UKWN;${fontname}</string>
      </dict>
      <dict>
        <key>encodingID</key>
        <integer>1</integer>
        <key>languageID</key>
        <integer>1033</integer>
        <key>nameID</key>
        <integer>3</integer>
        <key>platformID</key>
        <integer>3</integer>
        <key>string</key>
        <string>1.000;UKWN;${fontname}</string>
      </dict>
      <dict>
        <key>encodingID</key>
        <integer>0</integer>
        <key>languageID</key>
        <integer>0</integer>
        <key>nameID</key>
        <integer>4</integer>
        <key>platformID</key>
        <integer>1</integer>
        <key>string</key>
        <string>${fontname}</string>
      </dict>
      <dict>
        <key>encodingID</key>
        <integer>1</integer>
        <key>languageID</key>
        <integer>1033</integer>
        <key>nameID</key>
        <integer>4</integer>
        <key>platformID</key>
        <integer>3</integer>
        <key>string</key>
        <string>${fontname}</string>
      </dict>
      <dict>
        <key>encodingID</key>
        <integer>0</integer>
        <key>languageID</key>
        <integer>0</integer>
        <key>nameID</key>
        <integer>5</integer>
        <key>platformID</key>
        <integer>1</integer>
        <key>string</key>
        <string>Version 1.000;hotconv 1.0.111;makeotfexe 2.5.65597 DEVELOPMENT</string>
      </dict>
      <dict>
        <key>encodingID</key>
        <integer>1</integer>
        <key>languageID</key>
        <integer>1033</integer>
        <key>nameID</key>
        <integer>5</integer>
        <key>platformID</key>
        <integer>3</integer>
        <key>string</key>
        <string>Version 1.000;hotconv 1.0.111;makeotfexe 2.5.65597 DEVELOPMENT</string>
      </dict>
      <dict>
        <key>encodingID</key>
        <integer>0</integer>
        <key>languageID</key>
        <integer>0</integer>
        <key>nameID</key>
        <integer>6</integer>
        <key>platformID</key>
        <integer>1</integer>
        <key>string</key>
        <string>${fontname}</string>
      </dict>
      <dict>
        <key>encodingID</key>
        <integer>1</integer>
        <key>languageID</key>
        <integer>1033</integer>
        <key>nameID</key>
        <integer>6</integer>
        <key>platformID</key>
        <integer>3</integer>
        <key>string</key>
        <string>${fontname}</string>
      </dict>
      <dict>
        <key>encodingID</key>
        <integer>0</integer>
        <key>languageID</key>
        <integer>0</integer>
        <key>nameID</key>
        <integer>17</integer>
        <key>platformID</key>
        <integer>1</integer>
        <key>string</key>
        <string>Regular</string>
      </dict>
    </array>
    <key>openTypeNameUniqueID</key>
    <string>1.000;UKWN;${fontname}</string>
    <key>openTypeNameVersion</key>
    <string>Version 1.000;hotconv 1.0.111;makeotfexe 2.5.65597 DEVELOPMENT</string>
    <key>openTypeOS2CodePageRanges</key>
    <array>
      <integer>0</integer>
    </array>
    <key>openTypeOS2Panose</key>
    <array>
      <integer>0</integer>
      <integer>0</integer>
      <integer>4</integer>
      <integer>0</integer>
      <integer>0</integer>
      <integer>0</integer>
      <integer>0</integer>
      <integer>0</integer>
      <integer>0</integer>
      <integer>0</integer>
    </array>
    <key>openTypeOS2Selection</key>
    <array/>
    <key>openTypeOS2StrikeoutPosition</key>
    <integer>220</integer>
    <key>openTypeOS2StrikeoutSize</key>
    <integer>50</integer>
    <key>openTypeOS2SubscriptXOffset</key>
    <integer>0</integer>
    <key>openTypeOS2SubscriptXSize</key>
    <integer>650</integer>
    <key>openTypeOS2SubscriptYOffset</key>
    <integer>75</integer>
    <key>openTypeOS2SubscriptYSize</key>
    <integer>600</integer>
    <key>openTypeOS2SuperscriptXOffset</key>
    <integer>0</integer>
    <key>openTypeOS2SuperscriptXSize</key>
    <integer>650</integer>
    <key>openTypeOS2SuperscriptYOffset</key>
    <integer>350</integer>
    <key>openTypeOS2SuperscriptYSize</key>
    <integer>600</integer>
    <key>openTypeOS2Type</key>
    <array>
      <integer>2</integer>
    </array>
    <key>openTypeOS2TypoAscender</key>
    <integer>720</integer>
    <key>openTypeOS2TypoDescender</key>
    <integer>-280</integer>
    <key>openTypeOS2TypoLineGap</key>
    <integer>1000</integer>
    <key>openTypeOS2UnicodeRanges</key>
    <array>
      <integer>49</integer>
      <integer>50</integer>
    </array>
    <key>openTypeOS2VendorID</key>
    <string>UKWN</string>
    <key>openTypeOS2WeightClass</key>
    <integer>300</integer>
    <key>openTypeOS2WidthClass</key>
    <integer>5</integer>
    <key>openTypeOS2WinAscent</key>
    <integer>917</integer>
    <key>openTypeOS2WinDescent</key>
    <integer>83</integer>
    <key>openTypeVheaCaretOffset</key>
    <integer>0</integer>
    <key>openTypeVheaCaretSlopeRise</key>
    <integer>0</integer>
    <key>openTypeVheaCaretSlopeRun</key>
    <integer>1</integer>
    <key>openTypeVheaVertTypoAscender</key>
    <integer>500</integer>
    <key>openTypeVheaVertTypoDescender</key>
    <integer>-500</integer>
    <key>openTypeVheaVertTypoLineGap</key>
    <integer>1000</integer>
    <key>postscriptBlueValues</key>
    <array/>
    <key>postscriptFamilyBlues</key>
    <array/>
    <key>postscriptFamilyOtherBlues</key>
    <array/>
    <key>postscriptFontName</key>
    <string>${fontname}</string>
    <key>postscriptFullName</key>
    <string>${fontname} Regular</string>
    <key>postscriptIsFixedPitch</key>
    <false/>
    <key>postscriptOtherBlues</key>
    <array/>
    <key>postscriptStemSnapH</key>
    <array/>
    <key>postscriptStemSnapV</key>
    <array/>
    <key>postscriptUnderlinePosition</key>
    <integer>-75</integer>
    <key>postscriptUnderlineThickness</key>
    <integer>50</integer>
    <key>postscriptWeightName</key>
    <string>Regular</string>
    <key>styleMapFamilyName</key>
    <string>${fontname}</string>
    <key>styleMapStyleName</key>
    <string>regular</string>
    <key>styleName</key>
    <string>Regular</string>
    <key>unitsPerEm</key>
    <integer>1000</integer>
    <key>versionMajor</key>
    <integer>1</integer>
    <key>versionMinor</key>
    <integer>1</integer>
    <key>xHeight</key>
    <integer>0</integer>
  </dict>
</plist>
EOF

# groups.plist
cat <<EOF > ${fontname}.ufo/groups.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN"
"http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
</dict>
</plist>
EOF

# kerning.plist
cat <<EOF > ${fontname}.ufo/kerning.plist
<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
  </dict>
</plist>
EOF

# layercontents.plist
cat <<EOF > ${fontname}.ufo/layercontents.plist
<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <array>
    <array>
      <string>public.default</string>
      <string>glyphs</string>
    </array>
  </array>
</plist>
EOF

# metainfo.plist
cat <<EOF > ${fontname}.ufo/metainfo.plist
<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>creator</key>
    <string>com.github.fonttools.ufoLib</string>
    <key>formatVersion</key>
    <integer>3</integer>
  </dict>
</plist>
EOF

# glyphs/_nodef.glif

cat <<EOF > ${fontname}.ufo/glyphs/_nodef.glif
<?xml version='1.0' encoding='UTF-8'?>
<glyph name=".notdef" format="2">
  <advance height="1000" width="1000"/>
  <outline>
    <contour>
      <point x="66" y="33" type="line"/>
      <point x="66" y="633" type="line"/>
      <point x="265" y="633" type="line"/>
      <point x="265" y="33" type="line"/>
    </contour>
    <contour>
      <point x="33" y="0" type="line"/>
      <point x="298" y="0" type="line"/>
      <point x="298" y="666" type="line"/>
      <point x="33" y="666" type="line"/>
    </contour>
  </outline>
  <lib>
    <dict>
      <key>public.verticalOrigin</key>
      <integer>880</integer>
    </dict>
  </lib>
</glyph>

EOF