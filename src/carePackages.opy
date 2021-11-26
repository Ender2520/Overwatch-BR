#!mainFile "main.opy"

# === visuals and effects ===

rule "[CAREPACK] initialize":
    @Event global
    @Condition isGameInProgress()

    if getCurrentMap() in [Map.BLIZZ_WORLD, Map.BLIZZ_WORLD_WINTER]:
        while distance(CarePackage_LocationFINAL, zoneCenter) >= 65:
            CarePackage_LocationFINAL = random.choice([vect(-54.5,0.06,110), vect(-42.5,0.06,76), vect(-71.7,7.03,109), vect(-73.89,1.21,137.9), vect(-45.11,0.25,120.37), vect(-64.67,1.06,120.63)]) #add (0.46) to y
            wait(0.128)


    waitUntil(zoneCurrentSize <= CarePackageDropTime, 9999)
    #values
    CarePackage_Location = CarePackage_LocationFINAL + vect(0,150,0)
    getAllPlayers().CarePackageDelay = 100
    getAllPlayers().carePackageBarVisible = false
    getAllPlayers().carePackageVisible = true
    #queues
    smallMessage(getAllPlayers(), "{0} {1}".format(iconString(Icon.FIRE), "Care Package Dropped"))
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, CarePackageColors, CarePackage_LocationFINAL, 200)
    #effects
    createEffect([p for p in getAllPlayers() if p.carePackageVisible == true], Effect.SPHERE, CarePackageColors, CarePackage_Location, 1, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    createEffect([p for p in getAllPlayers() if p.carePackageVisible == true], Effect.RING, Color.RED, CarePackage_LocationFINAL, 1, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    CarePackageEffects.append(getLastCreatedEntity())
    createEffect([p for p in getAllPlayers() if p.carePackageVisible == true], Effect.CLOUD, Color.RED, CarePackage_LocationFINAL + vect(0,0.15,0), 1.75, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    CarePackageEffects.append(getLastCreatedEntity())
    #drop
    chase(CarePackage_Location, CarePackage_LocationFINAL, duration=15, ChaseReeval.DESTINATION_AND_DURATION)
    waitUntil([p for p in getAllPlayers() if p.carePackageVisible == true] == CarePackage_LocationFINAL, 99999)
    #landed
    destroyEffect(CarePackageEffects)
    createInWorldText([p for p in getAllPlayers() if p.carePackageVisible == true], "{0} [ {1} ]".format("Care Package", buttonString(Button.MELEE)), CarePackage_Location + vect(0,1.25,0), 2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_STRING_AND_COLOR, CarePackageColors, SpecVisibility.DEFAULT)


# === zone+package interaction ===

rule "[CAREPACK] remove when in zone":
    @Event global
    @Condition CarePackage_Location == CarePackage_LocationFINAL
    @Condition len([p for p in getAllPlayers() if p.carePackageBarVisible == true]) == 0
    @Condition distance(CarePackage_LocationFINAL * vect(1,0,1), zoneCenter * vect(1,0,1)) >= zoneCurrentSize + 10

    wait(5, Wait.ABORT_WHEN_FALSE)
    getAllPlayers().carePackageVisible = false
    getAllPlayers().carePackageBarVisible = false
    CarePackage_Location = vect(-999,-999,-999)
    CarePackage_LocationFINAL = vect(-666,-666,-666)

# === interaction ===

rule "[CAREPACK] opening":
    @Event eachPlayer
    @Condition isGameInProgress()
    @Condition eventPlayer.isHoldingButton(Button.MELEE)
    @Condition distance(eventPlayer, CarePackage_Location) <= 2
    @Condition CarePackage_Location == CarePackage_LocationFINAL

    chase(eventPlayer.CarePackageDelay, 0, duration=3, ChaseReeval.NONE)
    eventPlayer.carePackageBarVisible = true
    waitUntil(eventPlayer.isHoldingButton(Button.MELEE) != true or distance(eventPlayer, CarePackage_Location) > 2 or eventPlayer.CarePackageDelay == 0, 9999)
    if eventPlayer.CarePackageDelay == 0:
        CarePackageOpen()
    else:
        stopChasingVariable(eventPlayer.CarePackageDelay)
        eventPlayer.CarePackageDelay = 100
        eventPlayer.carePackageBarVisible = false

# === care package types ===

rule "[CAREPACK] set type/color":
    @Event global
    @Condition CarePackageRandomizer != null

    if CarePackageRandomizer <= 20: #<value
        CarePackageType = "HealPack"
        CarePackageColors = Color.LIME_GREEN
    elif 20 < CarePackageRandomizer and CarePackageRandomizer <= 70: #<value2 > value1
        CarePackageType = "ArmorPack"
        CarePackageColors = Color.YELLOW
    elif 70 < CarePackageRandomizer and CarePackageRandomizer <= 100: #<value2 > value 1
        CarePackageType = "UltPack"
        CarePackageColors = Color.VIOLET
    else:
        CarePackageColors = null