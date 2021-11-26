#!mainFile "../main.opy"

rule "Zone Location: Eichenwalde":
    @Condition isGameInProgress()
    @Condition getCurrentMap() in [Map.EICHENWALDE, Map.EICHENWALDE_HALLOWEEN]
    
    offset = vect(0,5,0)
    zoneVectors = [vect(42,0,-44), vect(27,0,-86), vect(32,0,-100),vect(96,0,-119), vect(106,0,-70)]
    zoneCurrentSize = 170
    wait()
    async(GroundPoint(), AsyncBehavior.NOOP)

rule "Care Package Locations: Eichenwalde":
    @Condition isGameInProgress()
    @Condition getCurrentMap() in [Map.EICHENWALDE, Map.EICHENWALDE_HALLOWEEN]

    CarePackage_LocationFINAL = random.choice([vect(41.6,8.22,-85.4), vect(77.2,13.13,-98), vect(87.3,13.11,-70.7), vect(53.3,18.5,-81.55), vect(56.4,21.45,-68.05), vect(60.12,19.18,-94.22), vect(42.8,5.85,-69.53)]) #add (0.46) to y
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