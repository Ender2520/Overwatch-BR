#!mainFile "../main.opy"

rule "Zone Location: Workshop Chamber":
    @Condition isGameInProgress()
    @Condition getCurrentMap() == Map.WORKSHOP_CHAMBER
     
    zoneCenter = vect(0,0,0)
    zoneCurrentSize = 200
    createEffect(getAllPlayers(), Effect.SPHERE, Zone_Color, zoneCenter, zoneCurrentSize, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    zoneEffect = getLastCreatedEntity()