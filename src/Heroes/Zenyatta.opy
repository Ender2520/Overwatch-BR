#!mainFile "../main.opy"

# === ZENYATTA CUSTOM CHANGES ===

rule "Zenyatta Give Health Pool":
    @Event eachPlayer
    @Hero zenyatta
    @Condition isGameInProgress()
    @Condition eventPlayer.hasSpawned()

    eventPlayer.addHealthPool(Health.NORMAL, 25, true, false)
    eventPlayer.addHealthPool(Health.SHIELDS, 25, true, false)