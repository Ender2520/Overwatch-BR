#!mainFile "../main.opy"

# === BAPTISTE CUSTOM CHANGES ===

rule "Baptiste Field Enable":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.BAPTISTE
    @Condition eventPlayer.hasSpawned()

    eventPlayer.setAbility2Enabled(true)

rule "Baptiste Field Detect":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.BAPTISTE
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) > 0
    
    eventPlayer.setAbility2Enabled(false)