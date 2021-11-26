#!mainFile "main.opy"

# === waiting for players hud ===

rule "waiting for players hud creation":
    @Event global
    @Condition isWaitingForPlayers()

    hudText(WaitingForPlayersText[0], iconString(Icon.RING_THICK), "Waiting For Players", "{0} / {1}".format(getNumberOfPlayers(Team.ALL), "3"), HudPosition.TOP, -98, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudText(WaitingForPlayersText[1], iconString(Icon.CHECKMARK), "Game Starting", "{0} / {1}".format(getNumberOfPlayers(Team.ALL), "3"), HudPosition.TOP, -97, Color.GREEN, Color.GREEN, Color.GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

rule "append players to white text":
    @Event eachPlayer
    @Condition isWaitingForPlayers()
    @Condition eventPlayer.hasSpawned()
    @Condition getNumberOfPlayers(Team.ALL) < 3

    WaitingForPlayersText[0].append(eventPlayer)
    WaitingForPlayersText[1].remove(eventPlayer)

rule "append players to green text":
    @Event eachPlayer
    @Condition isWaitingForPlayers()
    @Condition eventPlayer.hasSpawned()
    @Condition getNumberOfPlayers(Team.ALL) >= 3

    WaitingForPlayersText[0].remove(eventPlayer)
    WaitingForPlayersText[1].append(eventPlayer)