#!mainFile "../main.opy"

rule "Zone Location: Volskaya Industries":
    @Condition isGameInProgress()
    @Condition getCurrentMap() == Map.VOLSKAYA
    
    zoneCenter = random.choice([vect(-13.7,-3,90.3), vect(11.4,0,86.9), vect(-36.7,0,88.5), vect(-49.7,-2,67.1), vect(-66,-1,37), vect(-94.3,-1,49.3), vect(-92.6,-5,67.7), vect(-118.6,-2,49.9)])
    zoneCurrentSize = 170
    createEffect(getAllPlayers(), Effect.SPHERE, Zone_Color, zoneCenter, zoneCurrentSize, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    zoneEffect = getLastCreatedEntity()

rule "Care Package Locations: Volskaya Industries":
    @Event global
    @Condition isGameInProgress()
    @Condition getCurrentMap() == Map.VOLSKAYA

    CarePackage_LocationFINAL = random.choice([vect(-55.65,-3.70,72.79), vect(-42.12,2.48,97.1), vect(-13.73,-3.23,90.28), vect(-10.77,-2.84,69.89), vect(1.89,2.38,91.31), vect(12.4,-1.52,72.75)]) #add (0.46) to y
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