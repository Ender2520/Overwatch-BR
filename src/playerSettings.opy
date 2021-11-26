#!mainFile "main.opy"

# === player joining ===

rule "joined pre-game variable assignment":
    @Event eachPlayer
    @Condition eventPlayer.hasSpawned()
    @Condition zoneCurrentSize >= 120
    
    PreGameJoinPass.append(eventPlayer)

rule "joined mid-game eliminate":
    @Event eachPlayer
    @Condition eventPlayer.hasSpawned()
    @Condition isWaitingForPlayers() != true
    @Condition eventPlayer not in PreGameJoinPass
    @Condition zoneCurrentSize < 120
    
    kill(eventPlayer, null)
    if eventPlayer.getCurrentHero() == Hero.DVA:
        wait(2)
        goto RULE_START
    else:
    bigMessage(eventPlayer, "JOINED MID-MATCH | YOU'LL BE SPAWNED IN NEXT ROUND")

# === hero selection ===

rule "random hero on no selection":
    @Event eachPlayer
    @Condition eventPlayer.hasSpawned() != true
    @Condition isGameInProgress() == true

    eventPlayer.startForcingHero(random.choice(getAllHeroes()))
    eventPlayer.stopForcingCurrentHero()

# === auto-kick afk ===

rule "detect afk":
    @Event eachPlayer
    @Condition AfkAutoKick_TEST == true
    @Condition eventPlayer.isAlive()
    @Condition eventPlayer.isMoving() != true and eventPlayer.isFiringPrimaryFire() != true and eventPlayer.isFiringSecondaryFire() != true
    @Condition isGameInProgress() == true
    #@Condition eventPlayer != hostPlayer
    
    wait(45, Wait.ABORT_WHEN_FALSE)
    eventPlayer.AfkTimer = 15
    eventPlayer.AfkHUD.append(eventPlayer)
    eventPlayer.IsAFK = true

rule "stop afk":
    @Event eachPlayer
    @Condition AfkAutoKick_TEST == true
    @Condition eventPlayer.isMoving() == true or eventPlayer.isFiringPrimaryFire() == true or eventPlayer.isFiringSecondaryFire() == true
    @Condition eventPlayer.IsAFK == true

    eventPlayer.AfkTimer = 15
    eventPlayer.IsAFK = false
    eventPlayer.AfkHUD.remove(eventPlayer)

rule "countdown before kick":
    @Event eachPlayer
    @Condition AfkAutoKick_TEST == true
    @Condition eventPlayer.IsAFK == true

    if eventPlayer.AfkTimer == 0:
        goto lbl_0
    eventPlayer.AfkTimer -= 1
    playEffect(eventPlayer, DynamicEffect.EXPLOSION_SOUND, Color.WHITE, eventPlayer, 50)
    wait(1, Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START
    lbl_0:
        removeFromGame(eventPlayer)

rule "afk hud text":
    @Event eachPlayer
    @Condition AfkAutoKick_TEST == true
    
    hudSubtext(eventPlayer.AfkHUD, "{0}s until Kicked for Inactivity".format(eventPlayer.AfkTimer), HudPosition.TOP, -99, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)