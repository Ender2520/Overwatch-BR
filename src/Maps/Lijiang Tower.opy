#!mainFile "../main.opy"

rule "Zone Location: Lijiang Tower":
    @Condition isGameInProgress()
    @Condition getCurrentMap() in [Map.LIJIANG_CONTROL_CENTER, Map.LIJIANG_CONTROL_CENTER_LNY]
    
    offset = vect(0,265,0)
    zoneVectors = [vect(75,0,344), vect(41,270,307), vect(47,0,301), vect(32,0,287), vect(37,0,283), vect(12,0,258), vect(-12,0,258), vect(-37,0,283), vect(-32,0,287), vect(-47,0,301), vect(-41,270,307), vect(-75,0,344), vect(-61,0,358), vect(-53,0,350), vect(-43,0,360), vect(-36,0,353), vect(-29,0,360), vect(-10,0,323), vect(-5,0,337), vect(5,0,337), vect(10,0,323), vect(29,0,360), vect(36,0,353), vect(43,0,360), vect(53,0,350), vect(61,0,358)]
    zoneCurrentSize = 170
    wait()
    async(GroundPoint(), AsyncBehavior.NOOP)

rule "Care Package Locations: Lijiang Tower":
    @Event global
    @Condition isGameInProgress()
    @Condition getCurrentMap() in [Map.LIJIANG_CONTROL_CENTER, Map.LIJIANG_CONTROL_CENTER_LNY]

    CarePackage_LocationFINAL = random.choice([vect(39.48,267.46,320.74), vect(47.67,268.5,349.63), vect(49.05,265.46,330.28), vect(45.72,265.46,313.96), vect(-39.48,267.46,320.74), vect(-47.67,268.5,349.63), vect(-49.05,265.46,330.28), vect(-45.72,265.46,313.96)]) #add (0.46) to y
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