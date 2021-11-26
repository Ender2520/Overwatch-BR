#!mainFile "../main.opy"

rule "Roadhog Chain Hook Damage":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.ROADHOG
    @Condition eventPlayer.isUsingAbility1()

    eventPlayer.setDamageDealt(100)
    waitUntil(not eventPlayer.isUsingAbility1(), 99999)
    eventPlayer.setDamageDealt(77.28)

rule "Roadhog Whole Hog Damage":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.ROADHOG
    @Condition eventPlayer.isUsingUltimate()

    eventPlayer.setDamageDealt(31.429)
    waitUntil(not eventPlayer.isUsingUltimate(), 99999)
    eventPlayer.setDamageDealt(77.28)

rule "Roadhog Take A Breather Healing":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.ROADHOG
    @Condition eventPlayer.isUsingAbility2()

    eventPlayer.setHealingReceived(33.333)
    waitUntil(not eventPlayer.isUsingAbility2(), 99999)
    eventPlayer.setHealingReceived(100)