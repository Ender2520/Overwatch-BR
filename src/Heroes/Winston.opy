#!mainFile "../main.opy"

# === WINSTON CUSTOM CHANGES ===

rule "Ultimate Charge Gain Per Damage Recieved":
    @Event playerTookDamage
    @Condition eventPlayer.getCurrentHero() == Hero.WINSTON
    @Condition eventPlayer.getUltCharge() < 100
    @Condition eventPlayer.isUsingUltimate() != true

    eventPlayer.setUltCharge((eventPlayer.getUltCharge() + (eventDamage * (WinstonUltSpeed / 100))))
