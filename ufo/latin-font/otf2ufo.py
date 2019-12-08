from extractor import extractUFO
from defcon import Font

ufo = Font()
extractUFO("Roboto-Regular.ttf", ufo)
ufo.save("Roboto-Regular.ufo")