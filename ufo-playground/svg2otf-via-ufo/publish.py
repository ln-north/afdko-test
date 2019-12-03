import sys
import ufo2ft
import defcon
ufo = defcon.Font('LnNorthRound-Light.ufo')
otf = ufo2ft.compileOTF(ufo)
otf.save('LnNorthRound-Light.otf')