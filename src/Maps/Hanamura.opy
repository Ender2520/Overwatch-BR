#!mainFile "../main.opy"

rule "Zone Location: Hanamura":
    @Condition isGameInProgress()
    @Condition getCurrentMap() in [Map.HANAMURA, Map.HANAMURA_WINTER]
    
    offset = vect(0,-5,0)
    zoneVectors = [vect(22,0,38), vect(-14,0,33), vect(-19,0,-35),vect(-9,0,-35), vect(-10,0,-49), vect(-29,0,-53), vect(-39,0,-63), vect(-20,0,-79), vect(-29,0,-93), vect(-10,0,-108), vect(9,0,-92), vect(26,0,-82), vect(47,0,-76), vect(42,0,-40), vect(29,0,-17)]
    zoneCurrentSize = 170
    wait()
    async(GroundPoint(), AsyncBehavior.NOOP)

rule "Care Package Locations: Hanamura":
    @Event global
    @Condition isGameInProgress()
    @Condition getCurrentMap() in [Map.HANAMURA, Map.HANAMURA_WINTER]

    CarePackage_LocationFINAL = random.choice([vect(13.36,-0.53,-10.51), vect(31.57,2.46,-33.22), vect(-17.88,-0.82,-24.48), vect(13.18,-1.29,-39.82), vect(31.8,3.46,-83.23)]) #add (0.46) to y
    if distance(CarePackage_LocationFINAL, zoneCenter) >= 65:
        goto RULE_START
    else:
        createEffect([p for p in getAllPlayers() if p.carePackageVisible == true], Effect.SPHERE, CarePackageColors, CarePackage_Location, 1, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
        createEffect([p for p in getAllPlayers() if p.carePackageVisible == true], Effect.RING, Color.RED, CarePackage_LocationFINAL, 1, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
        CarePackageEffects.append(getLastCreatedEntity())
        createEffect([p for p in getAllPlayers() if p.carePackageVisible == true], Effect.CLOUD, Color.RED, CarePackage_LocationFINAL + vect(0,0.15,0), 1.75, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
        CarePackageEffects.append(getLastCreatedEntity())
        waitUntil([p for p in getAllPlayers() if p.carePackageVisible == true] == CarePackage_LocationFINAL, 99999)
        destroyEffect(CarePackageEffects)
        createInWorldText([p for p in getAllPlayers() if p.carePackageVisible == true], "{0} [ {1} ]".format("Care Package", buttonString(Button.MELEE)), CarePackage_Location + vect(0,1.25,0), 2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_STRING_AND_COLOR, CarePackageColors, SpecVisibility.DEFAULT)
        CarePackage_Location = CarePackage_LocationFINAL + vect(0,150,0)