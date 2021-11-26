#!include "settings.opy"

### GLOBAL VARIABLES ###

# init
globalvar heroUltArray

# zone variables
globalvar zoneCenter
globalvar zoneCenterNext
globalvar zoneCurrentSize 
globalvar zoneEffect
globalvar zoneVectors
globalvar angleTotal
globalvar vectorA
globalvar sumCounter
globalvar Zone_CurrentDamage 
globalvar Zone_Color
globalvar StartingZoneDamageValue 
globalvar offset

# pre game join pass
globalvar PreGameJoinPass

# care package
playervar carePackageBarVisible
playervar carePackageVisible
globalvar CarePackage_Location
globalvar CarePackage_LocationFINAL
globalvar CarePackageType
globalvar CarePackageRandomizer
globalvar CarePackageColors
globalvar CarePackageEffects
globalvar CarePackageDropTime

# round winner
globalvar RoundWinner

# anti crash
globalvar AutomaticAntiCrashActive

# custom hero values
globalvar SombraStealthDecayRate
globalvar SombraStealthRegenRate
globalvar SombraStealthRegenDelayTime
globalvar StartingSombraStealthValue
globalvar MaximumSombraStealthValue
globalvar WinstonUltSpeed

# testing options
globalvar ServerLoad_TEST
globalvar NoGameEnd_TEST
globalvar AfkAutoKick_TEST

# waiting for players hud
globalvar WaitingForPlayersText

### PLAYER VARIABLES ###

# custom hero values
playervar GenjiBladeChargeValue
playervar SombraStealthValue
playervar SombraEMPTempArmor
playervar MercyBeamActive
playervar MercyBeamTarget
playervar MercyTargetArray
playervar MercyDamageMultiplier
playervar MercyBeamVisible

# damage indicator variables
playervar LastEnemy
playervar TotalDamage
playervar DamageTextPos
playervar DamageTextID

# hero hud
playervar HeroHUDHidden
playervar HeroHUDArray

# care package
playervar CarePackageDelay

# afk detection
playervar IsAFK
playervar AfkHUD
playervar AfkTimer

# === activated extensions ===

#!extension debuffStatusEffects
#!extension beamSounds

# === GLOBAL & PLAYER ===

rule "GLOBAL":

    heroUltArray = [Hero.ANA, 1200, Hero.ASHE, 1350, Hero.BAPTISTE, 900, Hero.BASTION, 1500, Hero.BRIGITTE, 1400, Hero.DOOMFIST, 1400, Hero.DVA, 1700, 352.365, Hero.ECHO, 1200, Hero.GENJI, 1400, Hero.HANZO, 1600, Hero.JUNKRAT, 2000, Hero.LUCIO, 1350, Hero.MCCREE, 1100, Hero.MEI, 1400, Hero.MERCY, 850, Hero.MOIRA, 1300, Hero.PHARAH, 1900, Hero.REAPER, 1800, Hero.REINHARDT, 1400, Hero.ROADHOG, 1850, Hero.SIGMA, 1650, Hero.SOLDIER, 1800, Hero.SOMBRA, 950, Hero.SYMMETRA, 1100, Hero.TORBJORN, 1400, Hero.TRACER, 1200, Hero.WIDOWMAKER, 750, Hero.WINSTON, 585, Hero.HAMMOND, 1100, Hero.ZARYA, 1600, Hero.ZENYATTA, 1100]
    ServerLoad_TEST = createWorkshopSetting(bool, "Testing Options", "Enable Server Load Testing (only visible to host player)", false, -9)
    NoGameEnd_TEST = createWorkshopSetting(bool, "Testing Options", "Enable No Game End (game won't end when last player is standing)", false, -8)
    AfkAutoKick_TEST = createWorkshopSetting(bool, "Testing Options", "Enable Automatic AFK Kick System", true, -7)
    StartingSombraStealthValue = createWorkshopSetting(int[0:500], "Sombra Custom Settings", "Sombra Starting Stealth Value", 60, -10)
    SombraStealthDecayRate = createWorkshopSetting(float[0:100], "Sombra Custom Settings", "Sombra Stealth Decay Rate (per second)", 4.4, -9)
    SombraStealthRegenRate = createWorkshopSetting(float[0:100], "Sombra Custom Settings", "Sombra Stealth Regeneration Rate (per second)", 3.3, -8)
    MaximumSombraStealthValue = createWorkshopSetting(int[1:500], "Sombra Custom Settings", "Sombra Maximum Stealth Value", 100, -6)
    WinstonUltSpeed = createWorkshopSetting(float[0:100], "Winston Custom Settings", "Winston Ultimate Generation (% of damage recieved)", 11.111, -10)
    Zone_CurrentDamage = 20
    Zone_Color = Color.VIOLET
    CarePackageRandomizer = random.randint(1,100)

rule "GLOBAL EFFECT":

    #local effects
    createEffect([p for p in getAllPlayers() if distance(zoneCenter * vect(1,0,1), p.getPosition() * vect(1,0,1)) >= zoneCurrentSize - zoneCurrentSize * 0.050 and isGameInProgress()], Effect.ANA_BIOTIC_GRENADE_NO_HEALING, Color.TEAM_1, localPlayer, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.RING, Zone_Color, vect(zoneCenter.x,localPlayer.getPosition().y,zoneCenter.z), zoneCurrentSize, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    #zone effects
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Zone_Color, zoneCenter + offset + vect(0,49,0), zoneCurrentSize, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Zone_Color, zoneCenter + offset + vect(0,42,0), zoneCurrentSize, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Zone_Color, zoneCenter + offset + vect(0,35,0), zoneCurrentSize, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Zone_Color, zoneCenter + offset + vect(0,28,0), zoneCurrentSize, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Zone_Color, zoneCenter + offset + vect(0,21,0), zoneCurrentSize, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Zone_Color, zoneCenter + offset + vect(0,14,0), zoneCurrentSize, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Zone_Color, zoneCenter + offset + vect(0,7,0), zoneCurrentSize, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Zone_Color, zoneCenter + offset, zoneCurrentSize, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Zone_Color, zoneCenter + offset - vect(0,7,0), zoneCurrentSize, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Zone_Color, zoneCenter + offset - vect(0,14,0), zoneCurrentSize, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Zone_Color, zoneCenter + offset - vect(0,21,0), zoneCurrentSize, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    #zone center
    createBeam(getAllPlayers(), Beam.GOOD, zoneCenterNext + Vector.UP * 500, zoneCenterNext - Vector.UP * 500, Color.RED, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createBeam(getAllPlayers(), Beam.GOOD, zoneCenterNext + angleToDirection(0 + getTotalTimeElapsed() * 90, 0) * /*top distance*/0.25 + Vector.UP * /*height*/500, zoneCenterNext + angleToDirection(0 + getTotalTimeElapsed() * 90, 0) * /*bottom distance*/0.25 - Vector.UP * 500, Color.ORANGE, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createBeam(getAllPlayers(), Beam.GOOD, zoneCenterNext + angleToDirection(180 + getTotalTimeElapsed() * 90, 0) * /*top distance*/0.25 + Vector.UP * /*height*/500, zoneCenterNext + angleToDirection(180 + getTotalTimeElapsed() * 90, 0) * /*bottom distance*/0.25 - Vector.UP * 500, Color.ORANGE, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createIcon(getAllPlayers(), zoneCenterNext + offset + vect(0,75,0), Icon.RING_THIN, IconReeval.VISIBILITY_AND_POSITION, Color.WHITE, true)

rule "GLOBAL TEXT":

    progressBarHud([p for p in getAllPlayers() if p.carePackageBarVisible == true], localPlayer.CarePackageDelay, "Opening Care Package", HudPosition.TOP, -96, CarePackageColors, Color.WHITE, ProgressHudReeval.VISIBILITY_VALUES_AND_COLOR, SpecVisibility.DEFAULT)
    hudSubheader(getAllPlayers(), "Overwatch Battle Royale v1.13.0 | 10.2.2021", HudPosition.RIGHT, -98, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubheader(getAllPlayers(), "Original by u/Ender | Code: VWZQ2", HudPosition.RIGHT, -97, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubheader(getAllPlayers(), " ", HudPosition.RIGHT, -96, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudText(getAllPlayers(), "Discord", "Join for Updates and to Give Feedback", "bit.ly/ENDERSWORKSHOP (all caps)", HudPosition.RIGHT, -95, rgb(188,103,245), rgb(243,224,255), rgb(243,224,255), HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubheader(getAllPlayers(), " ", HudPosition.RIGHT, -94, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getAllPlayers(), " \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", HudPosition.TOP, -97, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.ALWAYS)

rule "GLOBAL GAME START":
    @Condition isGameInProgress()

    CarePackageDropTime = 120 + random.randint(-5,5) + random.randint(-5,5) + random.randint(-5,5) + random.randint(-5,5) + random.randint(-5,5)
    WaitingForPlayersText[0].remove(getAllPlayers())
    WaitingForPlayersText[1].remove(getAllPlayers())
    wait()
    hudText(getAllPlayers(), iconString(Icon.SKULL), "Players Remaining", "{0} / {1}".format(getNumberOfLivingPlayers(Team.ALL), getNumberOfPlayers(Team.ALL)), HudPosition.RIGHT, -93, Color.GRAY, Color.GRAY, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudSubheader(getAllPlayers(), " ", HudPosition.RIGHT, -92, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudText(getAllPlayers(), iconString(Icon.RADIOACTIVE), "Current Zone Size", zoneCurrentSize, HudPosition.RIGHT, -91, Color.VIOLET, Color.VIOLET, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudSubheader(getAllPlayers(), " ", HudPosition.RIGHT, -90, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "PLAYER":
    @Event eachPlayer
    @Condition eventPlayer.hasSpawned()

    eventPlayer.disableRespawn()
    eventPlayer.disableGamemodeHud()
    eventPlayer.enableDeathSpectateAllPlayers()
    eventPlayer.enableDeathSpectateTargetHud()

# === SUBROUTINES ===

#!include "sub.opy"

# === MECHANICS ===

rule "[MECH] Cleanup on Spawn":
    @Event eachPlayer
    @Condition eventPlayer.hasSpawned()

    async(Cleanup, AsyncBehavior.RESTART)

rule "[MECH] Start Game":
    @Condition getNumberOfPlayers(Team.ALL) >= 3
    @Condition isWaitingForPlayers() == true

    wait(1)
    startGamemode()

rule "[MECH] Decrease Assemble Time":
    @Condition isAssemblingHeroes()

    setMatchTime(20)

rule "[MECH] Win Condition":
    @Event global
    @Condition isGameInProgress()
    @Condition zoneCurrentSize < 170
    @Condition NoGameEnd_TEST != true
    @Condition len([p for p in getLivingPlayers(Team.ALL) if p.hasSpawned()]) == 1
    
    RoundWinner = [p for p in getLivingPlayers(Team.ALL) if p.hasSpawned()]
    setSlowMotion(25)
    wait(0.5)
    setSlowMotion(100)
    declarePlayerVictory(RoundWinner)

rule "[MECH] (DMGVFX) Reset Damage on New Enemy":
    @Event playerDealtDamage
    @Condition eventPlayer.LastEnemy != victim
    @Condition victim != attacker
    
    eventPlayer.TotalDamage = 0

rule "[MECH] (DMGVFX) Update Damage Value":
    @Event playerDealtDamage
    @Condition victim != attacker
    
    if eventPlayer.DamageTextID != null:
        goto lbl_0
    createInWorldText(eventPlayer, "-{0}".format(round(eventPlayer.TotalDamage * 10) / 10), eventPlayer.DamageTextPos, 1.25, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.DamageTextID = getLastCreatedText()
    lbl_0:
    eventPlayer.TotalDamage += eventDamage
    eventPlayer.DamageTextPos = victim.getEyePosition() + vect(0,0.4,0)
    eventPlayer.LastEnemy = victim

rule "[MECH] (DMGVFX) Remove Damage Value":
    @Event playerDealtDamage
    @Condition victim != attacker
    
    wait(2, Wait.RESTART_WHEN_TRUE)
    destroyInWorldText(eventPlayer.DamageTextID)
    eventPlayer.DamageTextID = null
    eventPlayer.DamageTextPos = null
    eventPlayer.TotalDamage = 0
    eventPlayer.LastEnemy = null

# === testing ===

#!include "testingOptions.opy"

# === hud ===

#!include "hudSetup.opy"
#!include "heroSpecificHUD.opy"

# === player ===

#!include "playerSettings.opy"
#!include "siphon+passiveHeal.opy"

# === care packages ===

#!include "carePackages.opy"

# === zone ===

#!include "zoneSettings.opy"

# === maps ===

#!include "Maps/Blizzard World.opy"
#!include "Maps/Eichenwalde.opy"
#!include "Maps/Hanamura.opy"
#!include "Maps/Horizon Lunar Colony.opy"
#!include "Maps/Kanezaka.opy"
#!include "Maps/Lijiang Garden.opy"
#!include "Maps/Lijiang Tower.opy"
#!include "Maps/Oasis City Center.opy"
#!include "Maps/Volskaya Industries.opy"
#!include "Maps/Workshop Chamber.opy"

# === heroes ===

#!include "Heroes/"