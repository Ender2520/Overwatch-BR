#!mainFile "../main.opy"

# === TORBJORN CUSTOM CHANGES ===

rule "Torbjorn Turret Enable":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.TORBJORN
    @Condition eventPlayer.hasSpawned()

    eventPlayer.setAbility1Enabled(true)

rule "Torbjorn Turret Detect":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.TORBJORN
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_1) > 0
    
    eventPlayer.setAbility1Enabled(false)