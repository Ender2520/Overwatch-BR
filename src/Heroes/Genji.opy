#!mainFile "../main.opy"

# === GENJI CUSTOM CHANGES ===

rule "Genji Charge Up Process":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition eventPlayer.isAlive()
    @Condition eventPlayer.getUltCharge() == 100
    @Condition isGameInProgress()
    @Condition eventPlayer.GenjiBladeChargeValue < 125
    
    eventPlayer.GenjiBladeChargeValue += 2.4 / 13.889
    wait(0.072)
    if RULE_CONDITION:
        goto RULE_START

rule "Genji Charge Up Damage/Effects":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition eventPlayer.isAlive()
    @Condition eventPlayer.isUsingUltimate() == true
    @Condition isGameInProgress()
    
    eventPlayer.setDamageDealt(eventPlayer.GenjiBladeChargeValue)
    waitUntil(not eventPlayer.isUsingUltimate(), 99999)
    eventPlayer.GenjiBladeChargeValue = 40
    eventPlayer.setDamageDealt(100)

rule "Genji Charge Up HUD Effect":
    @Event global
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.GENJI]) >= 1
    @Condition isGameInProgress()

    wait(0.25)
    hudSubtext(getPlayersOnHero(Hero.GENJI, Team.ALL), "                                                                                                    {0} Dragonblade Charge: {1}%".format(abilityIconString(Hero.GENJI, Button.ULTIMATE), localPlayer.GenjiBladeChargeValue), HudPosition.TOP, -100, rgba(20,208,8,255), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

rule "Genji Charge Value Default":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition eventPlayer.isAlive()
    @Condition eventPlayer.hasSpawned() == true
    
    eventPlayer.GenjiBladeChargeValue = 40

rule "Genji Prevent Above Maximum Charge":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition eventPlayer.isAlive()
    @Condition isGameInProgress()
    @Condition eventPlayer.GenjiBladeChargeValue > 125

    eventPlayer.GenjiBladeChargeValue = 125