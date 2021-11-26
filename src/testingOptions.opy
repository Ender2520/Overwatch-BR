#!mainFile "main.opy"

rule "server tick rate hud message":
    @Event global
    @Condition ServerLoad_TEST == true

    hudSubheader(hostPlayer, "Server Load {0} - Avg {1} - Peak {2}".format(getServerLoad(), getAverageServerLoad(), getPeakServerLoad()), HudPosition.RIGHT, -99, Color.GRAY, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

/*
rule "side camera":
    @Event eachPlayer
    @Condition eventPlayer.hasSpawned()
    @Condition getCurrentMap() == Map.WORKSHOP_CHAMBER
    @Condition isGameInProgress()

    eventPlayer.startCamera(worldVector(vect(4,1,2), eventPlayer, Transform.ROTATION_AND_TRANSLATION), worldVector(vect(0,1,2), eventPlayer, Transform.ROTATION_AND_TRANSLATION), 0)
*/