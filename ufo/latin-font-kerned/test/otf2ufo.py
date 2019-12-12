import sys
from extractor import extractUFO
from defcon import Font

args = sys.argv

ufo = Font()
extractUFO(args[1], ufo)
ufo.save(args[2])
