import sys
import ufo2ft
import defcon

args = sys.argv

ufo = defcon.Font(args[1])
otf = ufo2ft.compileOTF(ufo)
otf.save(args[2])
