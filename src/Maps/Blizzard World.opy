#!mainFile "../main.opy"

rule "Zone Location: Blizzard World":
    @Condition isGameInProgress()
    @Condition getCurrentMap() in [Map.BLIZZ_WORLD, Map.BLIZZ_WORLD_WINTER]
    
    offset = vect(0,0,0)
    zoneVectors = [vect(-33,0,153), vect(-59,0,145), vect(-65,0,159),vect(-79,0,155), vect(-74,0,130), vect(-77,0,91), vect(-79,0,64), vect(-39,0,63), vect(-17,0,89)]
    zoneCurrentSize = 170
    wait()
    async(GroundPoint(), AsyncBehavior.NOOP)