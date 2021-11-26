#!mainFile "../main.opy"

# ===MERCY CUSTOM CHANGES ===

rule "Mercy Beam Effect":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.MERCY
    @Condition eventPlayer.hasSpawned()

    #friendly w/o ult
    createBeam([p for p in eventPlayer.MercyBeamVisible if p == eventPlayer and eventPlayer.isUsingUltimate() != true], Beam.BAD, updateEveryTick(eventPlayer.getEyePosition() + worldVector(vect(-0.2,(eventPlayer.getFacingDirection().y - 0.1),0.7), eventPlayer, Transform.ROTATION)), updateEveryTick(eventPlayer.MercyBeamTarget + vect(0,1,0)), Color.AQUA, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    #friendly w/ ult
    createBeam([p for p in eventPlayer.MercyBeamVisible if p == eventPlayer and eventPlayer.isUsingUltimate() == true], Beam.BAD, updateEveryTick(eventPlayer.getEyePosition() + worldVector(vect(-0.2,(eventPlayer.getFacingDirection().y - 0.1),0.6), eventPlayer, Transform.ROTATION)), updateEveryTick(eventPlayer.MercyBeamTarget + vect(0,1,0)), Color.AQUA, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    #enemy w/o ult
    createBeam([p for p in eventPlayer.MercyBeamVisible if p != eventPlayer and eventPlayer.isUsingUltimate() != true], Beam.BAD, updateEveryTick(eventPlayer.getEyePosition() + worldVector(vect(-0.2,(eventPlayer.getFacingDirection().y - 0.5),0.6), eventPlayer, Transform.ROTATION)), updateEveryTick(eventPlayer.MercyBeamTarget + vect(0,1,0)), Color.RED, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    #enemy w ult
    createBeam([p for p in eventPlayer.MercyBeamVisible if p != eventPlayer and eventPlayer.isUsingUltimate() == true], Beam.BAD, updateEveryTick(eventPlayer.getEyePosition() + worldVector(vect(-0.2,(eventPlayer.getFacingDirection().y - 0.5),0.6), eventPlayer, Transform.ROTATION)), updateEveryTick(eventPlayer.MercyBeamTarget + vect(0,1,0)), Color.RED, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    #beam audio
    createEffect(eventPlayer.MercyBeamVisible, Effect.OMNIC_SLICER_BEAM_SOUND, Color.TEAM_1, eventPlayer, 80, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)

rule "Activate Beam On Firing":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.MERCY
    @Condition eventPlayer.isAlive()
    @Condition eventPlayer.getCurrentWeapon() == 1
    @Condition eventPlayer.isFiringPrimaryFire()
    @Condition eventPlayer.MercyBeamTarget != null

    wait(0.016)
    eventPlayer.MercyBeamActive = true
    eventPlayer.MercyBeamVisible.append(getAllPlayers())

rule "Unactivate Beam On Stop Firing":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.MERCY
    @Condition eventPlayer.isFiringPrimaryFire() != true

    eventPlayer.MercyBeamActive = false
    eventPlayer.MercyBeamVisible.remove(getAllPlayers())

rule "Determine Beam Target - based off array":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.MERCY
    @Condition eventPlayer.isAlive()
    @Condition eventPlayer.MercyBeamTarget != eventPlayer.MercyTargetArray[0]
    
    eventPlayer.MercyBeamTarget = eventPlayer.MercyTargetArray[0]

rule "Mercy Target Array":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.MERCY
    @Condition eventPlayer.isFiringPrimaryFire()

    eventPlayer.MercyTargetArray = sorted([p for p in getLivingPlayers(Team.ALL) if p != eventPlayer and eventPlayer.isInViewAngle(p, 23) and isInLoS(p, eventPlayer, BarrierLos.BLOCKED_BY_ALL_BARRIERS) and distance(p, eventPlayer) <= 10])
    wait(0.2)
    if RULE_CONDITION:
        goto RULE_START

rule "Hide Beam on Losing Target":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.MERCY
    @Condition eventPlayer.MercyBeamTarget == null

    eventPlayer.MercyBeamVisible.remove(getAllPlayers())

rule "Damage Mercy Beam Target":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.MERCY
    @Condition eventPlayer.MercyBeamActive == true
    @Condition eventPlayer.MercyBeamTarget != null

    damage(eventPlayer.MercyBeamTarget, eventPlayer, 5 ** eventPlayer.MercyDamageMultiplier)
    eventPlayer.MercyDamageMultiplier += 0.09
    wait(0.2)
    if RULE_CONDITION:
        goto RULE_START

rule "Reset Multiplier":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.MERCY
    @Condition eventPlayer.MercyBeamActive != true

    wait(0.8, Wait.ABORT_WHEN_FALSE)
    eventPlayer.MercyDamageMultiplier = 1