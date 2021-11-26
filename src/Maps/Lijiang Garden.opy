#!mainFile "../main.opy"

rule "Zone Location: Lijiang Garden":
    @Condition isGameInProgress()
    @Condition getCurrentMap() in [Map.LIJIANG_GARDEN, Map.LIJIANG_GARDEN_LNY]
    
    offset = vect(0,93,0)
    zoneVectors = [vect(-92,0,136), vect(-28,0,136), vect(-18,0,124),vect(-18,0,112), vect(18,0,112), vect(18,0,124), vect(28,0,136), vect(92,0,136), vect(92,0,154), vect(82,0,154), vect(82,0,164), vect(35,0,164), vect(35,0,181), vect(6,0,185), vect(0,0,189), vect(-6,0,185), vect(-35,0,181), vect(-35,0,164), vect(-82,0,164), vect(-82,0,154), vect(-92,0,154)]
    zoneCurrentSize = 170
    wait()
    async(GroundPoint(), AsyncBehavior.NOOP)

rule "Care Package Locations: Lijiang Garden":
    @Event global
    @Condition isGameInProgress()
    @Condition getCurrentMap() in [Map.LIJIANG_GARDEN, Map.LIJIANG_GARDEN_LNY]

    CarePackage_LocationFINAL = random.choice([vect(46.15,95.5,150.48), vect(20.63,96.46,134.45), vect(15.05,98.36,182.47), vect(14.2,95.46,115.95), vect(10.87,94.51,138.21), vect(-46.15,95.5,150.48), vect(-20.63,96.46,134.45), vect(-15.05,98.36,182.47), vect(-14.2,95.46,115.95), vect(-10.87,94.51,138.21)]) #add (0.46) to y
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