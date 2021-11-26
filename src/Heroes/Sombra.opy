#!mainFile "../main.opy"

# === SOMBRA CUSTOM CHANGES ===

rule "Sombra Stealth HUD Message":
    @Event global
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.SOMBRA]) >= 1
    @Condition isGameInProgress()
    
    wait(0.25)
    hudSubtext(getPlayersOnHero(Hero.SOMBRA, Team.ALL), "                                                                                                    {0} Stealth Amount: {1}".format(abilityIconString(Hero.SOMBRA, Button.ABILITY_1), round(localPlayer.SombraStealthValue)), HudPosition.TOP, -100, rgba(156,66,189,255), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

rule "Sombra Set Starting Value":
    @Event eachPlayer
    @Hero sombra
    @Condition eventPlayer.hasSpawned()
    @Condition isGameInProgress()
    
    eventPlayer.SombraStealthValue = StartingSombraStealthValue

rule "Sombra Decay Logic":
    @Event eachPlayer
    @Hero sombra
    @Condition eventPlayer.isUsingAbility1()
    @Condition eventPlayer.SombraStealthValue > 0
    
    eventPlayer.SombraStealthValue -= SombraStealthDecayRate / 13.889
    wait(0.072)
    if RULE_CONDITION:
        goto RULE_START

rule "Sombra Regeneration Logic":
    @Event eachPlayer
    @Hero sombra
    @Condition eventPlayer.isUsingAbility1() != true
    @Condition eventPlayer.SombraStealthValue < MaximumSombraStealthValue
    
    eventPlayer.SombraStealthValue += SombraStealthRegenRate / 13.889
    wait(0.072)
    if RULE_CONDITION:
        goto RULE_START

rule "Sombra Uses EMP":
    @Event eachPlayer
    @Hero sombra
    @Condition eventPlayer.isUsingUltimate()

    eventPlayer.addHealthPool(Health.SHIELDS, 100, false, false)
    eventPlayer.SombraEMPTempArmor = getLastCreatedHealthPool()
    waitUntil(eventPlayer.isUsingUltimate() != true, 999)
    removeHealthPool(eventPlayer.SombraEMPTempArmor)

rule "prevent abnormal stealth value":
    @Event eachPlayer
    @Hero sombra
    @Condition eventPlayer.isAlive()
    @Condition eventPlayer.SombraStealthValue > MaximumSombraStealthValue or eventPlayer.SombraStealthValue < 0
    
    if eventPlayer.SombraStealthValue > MaximumSombraStealthValue:
        eventPlayer.SombraStealthValue = 100
    elif eventPlayer.SombraStealthValue < 0:
        eventPlayer.SombraStealthValue = 0

rule "Exit Stealth on 0 Stealth Amount":
    @Event eachPlayer
    @Hero sombra
    @Condition eventPlayer.SombraStealthValue <= 0
    @Condition eventPlayer.isAlive()
    @Condition eventPlayer.isUsingAbility1()
    
    eventPlayer.forceButtonPress(Button.ABILITY_1)