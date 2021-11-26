#!mainFile "main.opy"

rule "Zone Closing":
    @Condition isGameInProgress()
    @Condition getCurrentMap() != Map.WORKSHOP_CHAMBER
    
    wait(30) #90
    async(GroundPoint(), AsyncBehavior.RESTART)
    Zone_Color = Color.TURQUOISE
    chase(zoneCurrentSize, 70, duration=60, ChaseReeval.NONE)
    chase(zoneCenter, zoneCenterNext, duration=60, ChaseReeval.DESTINATION_AND_DURATION)
    bigMessage(getAllPlayers(), "1st Zone is closing!")
    waitUntil(zoneCurrentSize == 70, 9999)
    Zone_Color = Color.VIOLET
    stopChasingVariable(zoneCenter)
    wait(30) #75
    async(GroundPoint(), AsyncBehavior.RESTART)
    Zone_Color = Color.TURQUOISE
    Zone_CurrentDamage = 13.333
    chase(zoneCurrentSize, 40, duration=45, ChaseReeval.NONE)
    chase(zoneCenter, zoneCenterNext, duration=45, ChaseReeval.DESTINATION_AND_DURATION)
    bigMessage(getAllPlayers(), "2nd Zone is closing!")
    waitUntil(zoneCurrentSize == 40, 9999)
    Zone_Color = Color.VIOLET
    stopChasingVariable(zoneCenter)
    wait(15) #60
    async(GroundPoint(), AsyncBehavior.RESTART)
    Zone_Color = Color.TURQUOISE
    chase(zoneCurrentSize, 20, duration=45, ChaseReeval.NONE)
    chase(zoneCenter, zoneCenterNext, duration=45, ChaseReeval.DESTINATION_AND_DURATION)
    bigMessage(getAllPlayers(), "3rd Zone is closing!")
    waitUntil(zoneCurrentSize == 20, 9999)
    Zone_Color = Color.VIOLET
    stopChasingVariable(zoneCenter)
    wait(15) #45
    async(GroundPoint(), AsyncBehavior.RESTART)
    Zone_Color = Color.TURQUOISE
    Zone_CurrentDamage = 11.111
    chase(zoneCurrentSize, 10, duration=30, ChaseReeval.NONE)
    chase(zoneCenter, zoneCenterNext, duration=30, ChaseReeval.DESTINATION_AND_DURATION)
    bigMessage(getAllPlayers(), "4th Zone is closing!")
    waitUntil(zoneCurrentSize == 10, 9999)
    Zone_Color = Color.VIOLET
    stopChasingVariable(zoneCenter)
    wait(15) #60
    async(GroundPoint(), AsyncBehavior.RESTART)
    Zone_Color = Color.TURQUOISE
    chase(zoneCurrentSize, 0, duration=45, ChaseReeval.NONE)
    chase(zoneCenter, zoneCenterNext, duration=45, ChaseReeval.DESTINATION_AND_DURATION)
    bigMessage(getAllPlayers(), "Final Zone is closing!")

# === zone damage logic ===

rule "zone check distance":
    @Event eachPlayer
    @Condition isGameInProgress()
    @Condition eventPlayer.isAlive()
    @Condition distance(zoneCenter * vect(1,0,1), eventPlayer.getPosition() * vect(1,0,1)) >= zoneCurrentSize - zoneCurrentSize * 0.050

    eventPlayer.setHealingReceived(25)
    while distance(zoneCenter * vect(1,0,1), eventPlayer.getPosition() * vect(1,0,1)) >= zoneCurrentSize - zoneCurrentSize * 0.050:
        damage(eventPlayer, null, eventPlayer.getMaxHealth() / Zone_CurrentDamage)
        wait(1)
    eventPlayer.setHealingReceived(100)