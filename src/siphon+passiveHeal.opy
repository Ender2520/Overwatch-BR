#!mainFile "main.opy"

rule "[Siphon] Provide Shield":
    @Event playerEarnedElimination
    
    eventPlayer.siphonPoolCount += round(eventPlayer.getMaxHealth() / 25)
    j = 0
    # create health pools
    for i in range(eventPlayer.siphonPoolCount):
        eventPlayer.addHealthPool(Health.SHIELD, 5, true, false)
        eventPlayer.siphonPoolArray.append(getLastCreatedEntity())
