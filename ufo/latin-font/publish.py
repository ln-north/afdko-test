import sys
import ufo2ft
import defcon
ufo = defcon.Font('LnNorthRound-Latin-Light.ufo')
otf = ufo2ft.compileOTF(ufo)
otf.save('LnNorthRound-Latin-Light.otf')