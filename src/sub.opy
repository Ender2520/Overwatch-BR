#!mainFile "main.opy"

def Cleanup():
    
def CarePackageOpen():

    getAllPlayers().carePackageVisible = false
    getAllPlayers().carePackageBarVisible = false
    CarePackage_Location = vect(-999,-999,-999)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, CarePackageColors, CarePackage_LocationFINAL, 1)
    playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, CarePackageColors, CarePackage_LocationFINAL, 100)
    smallMessage(eventPlayer, "{0} {1}".format(iconString(Icon.FIRE), "Care Package Collected"))
    if CarePackageType == "ArmorPack":
        eventPlayer.addHealthPool(Health.ARMOR, random.randint(1,4) * 25, false, false)
        smallMessage(eventPlayer, "{0} {1}".format(abilityIconString(Hero.ORISA, Button.ABILITY_1), "Armor Administered"))
    elif CarePackageType == "HealPack":
        eventPlayer.setHealth(9999)
        smallMessage(eventPlayer, "{0} {1}".format(iconString(Icon.PLUS), "Full Health Regenerated"))
    elif CarePackageType == "UltPack":
        eventPlayer.setUltCharge(eventPlayer.getUltCharge() + (((random.randint(1,6) * 100) / heroUltArray[1 + (eventPlayer.getCurrentHero() == Hero.DVA and eventPlayer.isInAlternateForm()) + heroUltArray.index(eventPlayer.getCurrentHero())]) * 100))
        smallMessage(eventPlayer, "{0} {1}".format(iconString(Icon.SPIRAL), "Ultimate Charge Administered"))
    else:
        smallMessage(eventPlayer, "Debug Code #001")

def SumOfAngles():

    for sumCounter in range(0, len(zoneVectors)):
        angleTotal += angleDifference(horizontalAngleOfDirection(vectorTowards(vectorA, zoneVectors[(sumCounter+1)%len(zoneVectors)])), horizontalAngleOfDirection(vectorTowards(vectorA, zoneVectors[sumCounter])))

def VectorRandomizer():
    
    if getCurrentMap() in [Map.BLIZZ_WORLD, Map.BLIZZ_WORLD_WINTER]:
        vectorA = vect(random.randint(-79,-17),0,random.randint(63,159))
    elif getCurrentMap() in [Map.EICHENWALDE, Map.EICHENWALDE_HALLOWEEN]:
        vectorA = vect(random.randint(27,106),0,random.randint(-119,-44))
    elif getCurrentMap() in [Map.HANAMURA, Map.HANAMURA_WINTER]:
        vectorA = vect(random.randint(-29,47),0,random.randint(-108,38))
    elif getCurrentMap() in [Map.HORIZON_LUNAR_COLONY]:
        vectorA = vect(random.randint(-39,47),0,random.randint(-76,38))
    elif getCurrentMap() in [Map.KANEZAKA]:
        vectorA = vect(random.randint(-59,15),0,random.randint(-57,45))
    elif getCurrentMap() in [Map.LIJIANG_GARDEN, Map.LIJIANG_GARDEN_LNY]:
        vectorA = vect(random.randint(-92,92),0,random.randint(112,189))
    elif getCurrentMap() in [Map.LIJIANG_CONTROL_CENTER, Map.LIJIANG_CONTROL_CENTER_LNY]:
        vectorA = vect(random.randint(-75,75),0,random.randint(323,360))

def GroundPoint():

    VectorRandomizer()
    SumOfAngles()
    wait(0.128)
    if abs(angleTotal) < 180:
        angleTotal = 0
        wait()
        async(GroundPoint(), AsyncBehavior.RESTART)
    else:
        if zoneCurrentSize == 170:
            zoneCenter = vectorA
            angleTotal = 0
        elif zoneCurrentSize != 170:
            zoneCenterNext = vectorA
            angleTotal = 0

rule "angle total hud":
    @Event eachPlayer

    hudHeader(eventPlayer, "{0}".format(angleTotal), HudPosition.TOP, -1000, Color.WHITE, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR)
