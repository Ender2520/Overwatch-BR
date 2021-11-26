#!mainFile "../main.opy"

rule "Zone Location: Oasis City Center":
    @Condition isGameInProgress()
    @Condition getCurrentMap() == Map.OASIS_CITY_CENTER
    
    zoneCenter = random.choice([vect(143.5,1,247.5), vect(121,0,224.8), vect(173.5,1,217.5), vect(155.1,10,259.1), vect(122.2,3,268.7), vect(109,0,302.1), vect(100,0,271.4), vect(168.4,3,272.4)])
    zoneCurrentSize = 170
    createEffect(getAllPlayers(), Effect.SPHERE, Zone_Color, zoneCenter, zoneCurrentSize, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    zoneEffect = getLastCreatedEntity()

rule "Care Package Locations: Oasis City Center":
    @Event global
    @Condition isGameInProgress()
    @Condition getCurrentMap() == Map.OASIS_CITY_CENTER

    CarePackage_LocationFINAL = random.choice([vect(154.4,11.98,258.46), vect(135.45,2.46,255.56), vect(151.52,2.46,255.52), vect(151.48,2.46,239.49), vect(119,1.46,223.81), vect(125.26,2.31,291.38), vect(187.3,2.31,229.12), vect(153.95,4.46,272.05), vect(168.31,4.46,257.28), vect(100.95,1.46,264.02), vect(159.72,1.46,204.73)]) #add (0.46) to y
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