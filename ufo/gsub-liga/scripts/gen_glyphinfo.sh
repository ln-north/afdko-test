#!/bin/bash

# glyphs/にあるファイル.glifファイルからcontent.plistとlib.plistを作成する

# USAGE
# ./gen_glyphinfo.sh {ufoDir}

ufoDir=$1
libPlistPath=${ufoDir}/lib.plist
contentsPlistPath=${ufoDir}/glyphs/contents.plist

# lib.plist
cat <<EOF >> ${libPlistPath}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>public.glyphOrder</key>
  <array>
EOF

# contents.plist
cat <<EOF >> ${contentsPlistPath}
<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
EOF

filenames=($(ls ${ufoDir}/glyphs | grep '.glif$' | xargs -I %% basename %% .glif))

for filename in ${filenames[@]}; do
  glyphname=$filename

  # _nodef.glif のグリフ名は .nodef
  if test $filename = "_nodef" ; then
    glyphname=".nodef"
  fi

  # lib.plist
  echo "    <string>${glyphname}</string>" >> ${libPlistPath}

  # contents.plist
  echo "    <key>${glyphname}</key>" >> ${contentsPlistPath}
  echo "    <string>${filename}.glif</string>" >> ${contentsPlistPath}
done

# lib.plist
cat <<EOF >> ${libPlistPath}
  </array>
</dict>
</plist>
EOF

# contents.plist
cat <<EOF >> ${contentsPlistPath}
  </dict>
</plist>
EOF