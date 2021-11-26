#!mainFile "../main.opy"

rule "Zone Location: Kanezaka":
    @Condition isGameInProgress()
    @Condition getCurrentMap() in [Map.KANEZAKA]
    
    offset = vect(0,4,0)
    zoneVectors = [vect(13,0,-37), vect(-2,0,-51), vect(-23,0,-51),vect(-43,0,-57), vect(-53,0,-37), vect(-59,0,-12), vect(-55,0,36), vect(-36,0,36), vect(-29,0,45), vect(-5,0,45), vect(-6,0,28), vect(4,0,22), vect(3,0,14), vect(15,0,2), vect(5,0,-9), vect(14,0,-13)]
    zoneCurrentSize = 170
    wait()
    async(GroundPoint(), AsyncBehavior.NOOP)

rule "Care Package Locations: Kanezaka":
    @Event global
    @Condition isGameInProgress()
    @Condition getCurrentMap() in [Map.KANEZAKA]

    CarePackage_LocationFINAL = random.choice([vect(-12.24,10.47,-34.91), vect(-48.63,11.46,-43.58), vect(-21.46,10.46,0.7), vect(-51.49,8.46,6.71), vect(-21.99,6.3,28.18), vect(-12.17,6.33,4.03), vect(-1.26,5.39,-28.52)]) #add (0.46) to y
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