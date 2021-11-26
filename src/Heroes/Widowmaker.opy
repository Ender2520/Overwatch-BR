#!mainFile "../main.opy"

# === WIDOWMAKER CUSTOM CHANGES ===

rule "Widowmaker Damage Increase Scoped":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.WIDOWMAKER
    @Condition isGameInProgress()
    @Condition eventPlayer.isFiringSecondaryFire() == true
    
    wait(0.333)
    eventPlayer.setDamageDealt(133.333)
    waitUntil(not eventPlayer.isFiringSecondaryFire(), 99999)
    eventPlayer.setDamageDealt(100)