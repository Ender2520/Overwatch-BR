#!mainFile "../main.opy"

# === REINHARDT CUSTOM CHANGES ===

rule "Reinhardt Give Health Pool":
    @Event eachPlayer
    @Hero reinhardt
    @Condition isGameInProgress()
    @Condition eventPlayer.hasSpawned()

    eventPlayer.addHealthPool(Health.NORMAL, 112.5, true, false)
    eventPlayer.addHealthPool(Health.ARMOR, 75, true, false)