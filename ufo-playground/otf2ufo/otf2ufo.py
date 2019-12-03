from extractor import extractUFO
from defcon import Font

ufo = Font()
extractUFO("AFDKOSample-Light_min.otf", ufo)
ufo.save("AFDKOSample-Light_min.ufo")