#!mainFile "main.opy"

rule "ana information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.ANA]) >= 1
    
    hudText(getPlayersOnHero(Hero.ANA, Team.ALL), " {0} ".format(heroIcon(Hero.ANA)), "B Tier Hero", "Ana", HudPosition.LEFT, -100, rgba(74,142,232,255), rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.ANA, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Base
    hudText(getPlayersOnHero(Hero.ANA, Team.ALL), "", "{0} Base".format(iconString(Icon.HEART)), "  Health Increased from 200 to 225", HudPosition.LEFT, -98, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Nano-Boost
    hudText(getPlayersOnHero(Hero.ANA, Team.ALL), "", "{0} Ultimate | Nano-Boost".format(abilityIconString(Hero.ANA,Button.ULTIMATE)), "  Ultimate Cost Decreased from 2100 to 1200", HudPosition.LEFT, -97, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "ashe information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.ASHE]) >= 1
    
    hudText(getPlayersOnHero(Hero.ASHE, Team.ALL), " {0} ".format(heroIcon(Hero.ASHE)), "B Tier Hero", "Ashe", HudPosition.LEFT, -100, rgba(232,216,207,255), rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.ASHE, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Base
    hudText(getPlayersOnHero(Hero.ASHE, Team.ALL), "", "{0} Base".format(iconString(Icon.HEART)), "  Health Increased from 200 to 225", HudPosition.LEFT, -98, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #B.O.B.
    hudText(getPlayersOnHero(Hero.ASHE, Team.ALL), "", "{0} Ultimate | B.O.B.".format(abilityIconString(Hero.ASHE,Button.ULTIMATE)), "  Ultimate Cost Decreased from 2240 to 1350", HudPosition.LEFT, -97, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "baptiste information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.BAPTISTE]) >= 1
    
    hudText(getPlayersOnHero(Hero.BAPTISTE, Team.ALL), " {0} ".format(heroIcon(Hero.BAPTISTE)), "A Tier Hero", "Baptiste", HudPosition.LEFT, -100, rgba(74,111,108,255), rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.BAPTISTE, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Base
    hudText(getPlayersOnHero(Hero.BAPTISTE, Team.ALL), "", "{0} Base".format(iconString(Icon.HEART)), "  Health Increased from 200 to 250", HudPosition.LEFT, -98, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Immortality Field
    hudText(getPlayersOnHero(Hero.BAPTISTE, Team.ALL), "", "{0} Immortality Field".format(abilityIconString(Hero.BAPTISTE,Button.ABILITY_2)), "  Can be used once throughout the enire round", HudPosition.LEFT, -96, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Amplification Matrix
    hudText(getPlayersOnHero(Hero.BAPTISTE, Team.ALL), "", "{0} Ultimate | Amplification Matrix".format(abilityIconString(Hero.BAPTISTE,Button.ULTIMATE)), "  Ultimate Cost Decreased from 2310 to 900", HudPosition.LEFT, -95, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "bastion information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.BASTION]) >= 1
    
    hudText(getPlayersOnHero(Hero.BASTION, Team.ALL), " {0} ".format(heroIcon(Hero.BASTION)), "B Tier Hero", "Bastion", HudPosition.LEFT, -100, rgba(208,207,205,255), rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.BASTION, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Self-Repair
    hudText(getPlayersOnHero(Hero.BASTION, Team.ALL), "", "{0} Secondary | Self-Repair".format(abilityIconString(Hero.BASTION,Button.SECONDARY_FIRE)), "  Regeneration Rate Decreased by 50%", HudPosition.LEFT, -98, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Configuration: Tank
    hudText(getPlayersOnHero(Hero.BASTION, Team.ALL), "", "{0} Ultimate | Configuration: Tank".format(abilityIconString(Hero.BASTION,Button.ULTIMATE)), "  Ultimate Cost Decreased from 2310 to 1500", HudPosition.LEFT, -97, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)


rule "brigitte information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.BRIGITTE]) >= 1
    
    hudText(getPlayersOnHero(Hero.BRIGITTE, Team.ALL), " {0} ".format(heroIcon(Hero.BRIGITTE)), "A Tier Hero", "Brigitte", HudPosition.LEFT, -100, rgba(177,76,47,255), rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.BRIGITTE, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Barrier Shield
    hudText(getPlayersOnHero(Hero.BRIGITTE, Team.ALL), "", "{0} Secondary | Barrier Shield".format(abilityIconString(Hero.BRIGITTE,Button.SECONDARY_FIRE)), "  Recharge Rate Decreased from 85 to 25 per second", HudPosition.LEFT, -98, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Whip Shot
    hudText(getPlayersOnHero(Hero.BRIGITTE, Team.ALL), "", "{0} Ability 1 | Whip Shot".format(abilityIconString(Hero.BRIGITTE,Button.ABILITY_1)), "  Cooldown Increased from 4.0 to 6.0", HudPosition.LEFT, -97, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Rally
    hudText(getPlayersOnHero(Hero.BRIGITTE, Team.ALL), "", "{0} Ultimate | Rally".format(abilityIconString(Hero.BRIGITTE,Button.ULTIMATE)), "  Ultimate Cost Decreased from 2800 to 1400", HudPosition.LEFT, -96, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "d.va information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.DVA]) >= 1
    
    hudText(getPlayersOnHero(Hero.DVA, Team.ALL), " {0} ".format(heroIcon(Hero.DVA)), "S Tier Hero", "D.Va", HudPosition.LEFT, -100, rgba(252,114,212,255), rgba(255,127,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.DVA, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Base
    hudText(getPlayersOnHero(Hero.DVA, Team.ALL), "", "{0} Base".format(iconString(Icon.HEART)), "  Health Decreased from 600-150 to 500-125", HudPosition.LEFT, -98, Color.WHITE, rgba(255,127,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Defense Matrix
    hudText(getPlayersOnHero(Hero.DVA, Team.ALL), "", "{0} Secondary | Defense Matrix".format(abilityIconString(Hero.DVA, Button.SECONDARY_FIRE)), "  Recharge Rate Decreased by 50%", HudPosition.LEFT, -97, Color.WHITE, rgba(255,127,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Self-Destruct
    hudText(getPlayersOnHero(Hero.DVA, Team.ALL), "", "{0} Ultimate | Self-Destruct".format(abilityIconString(Hero.DVA,Button.ULTIMATE)), "  Ultimate Cost Increased from 1540 to 1700", HudPosition.LEFT, -95, Color.WHITE, rgba(255,127,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "doomfist information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.DOOMFIST]) >= 1

    hudText(getPlayersOnHero(Hero.DOOMFIST, Team.ALL), " {0} ".format(heroIcon(Hero.DOOMFIST)), "A Tier Hero", "Doomfist", HudPosition.LEFT, -100, rgba(90,78,79,255), rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.DOOMFIST, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Rocket Punch
    hudText(getPlayersOnHero(Hero.DOOMFIST, Team.ALL), "", "{0} Secondary | Rocket Punch".format(abilityIconString(Hero.DOOMFIST,Button.SECONDARY_FIRE)), "  Cooldown Increased from 4.0 to 6.0 seconds", HudPosition.LEFT, -98, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Meteor Strike
    hudText(getPlayersOnHero(Hero.DOOMFIST, Team.ALL), "", "{0} Ultimate | Meteor Strike".format(abilityIconString(Hero.DOOMFIST,Button.ULTIMATE)), "  Ultimate Cost Decreased from 1680 to 1400", HudPosition.LEFT, -95, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "echo information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.ECHO]) >= 1

    hudText(getPlayersOnHero(Hero.ECHO, Team.ALL), " {0} ".format(heroIcon(Hero.ECHO)), "B Tier Hero", "Echo", HudPosition.LEFT, -100, rgba(93,195,255,255), rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.ECHO, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Duplicate
    hudText(getPlayersOnHero(Hero.ECHO, Team.ALL), "", "{0} Ultimate | Duplicate".format(abilityIconString(Hero.ECHO,Button.ULTIMATE)), "  Ultimate Cost Decreased from 1960 to 1200", HudPosition.LEFT, -97, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "genji information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.GENJI]) >= 1

    hudText(getPlayersOnHero(Hero.GENJI, Team.ALL), " {0} ".format(heroIcon(Hero.GENJI)), "A Tier Hero", "Genji", HudPosition.LEFT, -100, rgba(20,208,8,255), rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.GENJI, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Dragonblade
    hudText(getPlayersOnHero(Hero.GENJI, Team.ALL), "", "{0} Ultimate | Dragonblade".format(abilityIconString(Hero.GENJI,Button.ULTIMATE)), "  Charges up the longer you hold onto it\n  Ultimate Cost Decreased from 1932 to 1400", HudPosition.LEFT, -97, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "hanzo information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.HANZO]) >= 1

    hudText(getPlayersOnHero(Hero.HANZO, Team.ALL), " {0} ".format(heroIcon(Hero.HANZO)), "B Tier Hero", "Hanzo", HudPosition.LEFT, -100, rgba(32,145,203,255), rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.HANZO, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Storm Arrows
    hudText(getPlayersOnHero(Hero.HANZO, Team.ALL), "", "{0} Ability 2 | Storm Arrows".format(abilityIconString(Hero.HANZO,Button.ABILITY_2)), "  Quantity Decreased from 5 to 4", HudPosition.LEFT, -98, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Dragonstrike
    hudText(getPlayersOnHero(Hero.HANZO, Team.ALL), "", "{0} Ultimate | Dragonstrike".format(abilityIconString(Hero.HANZO,Button.ULTIMATE)), "  Ultimate Cost Decreased from 1680 to 1600", HudPosition.LEFT, -97, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "junkrat information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.JUNKRAT]) >= 1

    hudText(getPlayersOnHero(Hero.JUNKRAT, Team.ALL), " {0} ".format(heroIcon(Hero.JUNKRAT)), "B Tier Hero", "Junkrat", HudPosition.LEFT, -100, rgba(236,181,0,255), rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.JUNKRAT, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #RIP-Tire
    hudText(getPlayersOnHero(Hero.JUNKRAT, Team.ALL), "", "{0} Ultimate | RIP-Tire".format(abilityIconString(Hero.JUNKRAT,Button.ULTIMATE)), "  Ultimate Cost Increased from 1925 to 2000", HudPosition.LEFT, -98, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)


rule "lucio information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.LUCIO]) >= 1

    hudText(getPlayersOnHero(Hero.LUCIO, Team.ALL), " {0} ".format(heroIcon(Hero.LUCIO)), "A Tier Hero", "Lucio", HudPosition.LEFT, -100, rgba(173,205,107,255), rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.LUCIO, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Crossfade
    hudText(getPlayersOnHero(Hero.LUCIO, Team.ALL), "", "{0} Ability 1 | Crossfade".format(abilityIconString(Hero.LUCIO,Button.ABILITY_1)), "  Healing Decreased from 12.3 to 7.0 per second", HudPosition.LEFT, -98, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Amp It Up
    hudText(getPlayersOnHero(Hero.LUCIO, Team.ALL), "", "{0} Ability 2 | Amp It Up".format(abilityIconString(Hero.LUCIO,Button.ABILITY_2)), "  Healing Decreased from 40 to 28 per second\n  Cooldown increased from 12.0 to 18.0 seconds", HudPosition.LEFT, -97, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Sound Barrier
    hudText(getPlayersOnHero(Hero.LUCIO, Team.ALL), "", "{0} Ultimate | Sound Barrier".format(abilityIconString(Hero.LUCIO,Button.ULTIMATE)), "  Ultimate Cost Decreased from 2940 to 1350", HudPosition.LEFT, -96, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "mccree information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.MCCREE]) >= 1

    hudText(getPlayersOnHero(Hero.MCCREE, Team.ALL), " {0} ".format(heroIcon(Hero.MCCREE)), "S Tier Hero", "Mccree", HudPosition.LEFT, -100, rgba(197,40,43,255), rgba(255,127,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.MCCREE, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Peacemaker PF
    hudText(getPlayersOnHero(Hero.MCCREE, Team.ALL), "", "{0} Primary | Peacemaker".format(abilityIconString(Hero.MCCREE,Button.PRIMARY_FIRE)), "  Damage Decreased from 35-70 to 29.75-59.5", HudPosition.LEFT, -98, Color.WHITE, rgba(255,127,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Peacemaker SF
    hudText(getPlayersOnHero(Hero.MCCREE, Team.ALL), "", "{0} Secondary | Peacemaker".format(abilityIconString(Hero.MCCREE,Button.SECONDARY_FIRE)), "  Damage Decreased from 25-50 to 21.25-42.5", HudPosition.LEFT, -97, Color.WHITE, rgba(255,127,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Deadeye
    hudText(getPlayersOnHero(Hero.MCCREE, Team.ALL), "", "{0} Ultimate | Deadeye".format(abilityIconString(Hero.MCCREE,Button.ULTIMATE)), "  Ultimate Cost Decreased from 1680 to 1100", HudPosition.LEFT, -96, Color.WHITE, rgba(255,127,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "mei information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.MEI]) >= 1

    hudText(getPlayersOnHero(Hero.MEI, Team.ALL), " {0} ".format(heroIcon(Hero.MEI)), "A Tier Hero", "Mei", HudPosition.LEFT, -100, rgba(240,230,217,255), rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.MEI, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Endothermatic Blaster
    hudText(getPlayersOnHero(Hero.MEI, Team.ALL), "", "{0} Primary | Endothermatic Blaster".format(abilityIconString(Hero.MEI,Button.PRIMARY_FIRE)), "  Minimum Freeze Decreased from 30% to 20%\n  Freeze Duration Decreased from 1.3 to 1.0 seconds\n  Freeze Rate Decreased from 100% to 70%", HudPosition.LEFT, -98, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Blizzard
    hudText(getPlayersOnHero(Hero.MEI, Team.ALL), "", "{0} Ultimate | Blizzard".format(abilityIconString(Hero.MEI,Button.ULTIMATE)), "  Minimum Freeze Increased from 50% to 75%\n  Freeze Rate Decreased from 100% to 15%\n  Ultimate Cost Decreased from 1610 to 1400", HudPosition.LEFT, -97, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "mercy information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.MERCY]) >= 1

    hudText(getPlayersOnHero(Hero.MERCY, Team.ALL), " {0} ".format(heroIcon(Hero.MERCY)), "A Tier Hero", "Mercy", HudPosition.LEFT, -100, rgba(246,214,104,255), rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.MERCY, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Caduceus Blaster
    hudText(getPlayersOnHero(Hero.MERCY, Team.ALL), "", "{0} Primary | Caduceus Blaster".format(abilityIconString(Hero.MERCY,Button.PRIMARY_FIRE)), "  Damage Increased from 20 to 22", HudPosition.LEFT, -98, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Caduceus Staff
    hudText(getPlayersOnHero(Hero.MERCY, Team.ALL), "", "{0} Primary | Caduceus Staff".format(abilityIconString(Hero.MERCY,Button.PRIMARY_FIRE)), "  Deals Exponentially Increasing Damage to Target", HudPosition.LEFT, -97, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Valkyrie
    hudText(getPlayersOnHero(Hero.MERCY, Team.ALL), "", "{0} Ultimate | Valkyrie".format(abilityIconString(Hero.MERCY,Button.ULTIMATE)), "  Ultimate Cost Decreased from ~1525 to 850", HudPosition.LEFT, -96, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "moira information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.MOIRA]) >= 1

    hudText(getPlayersOnHero(Hero.MOIRA, Team.ALL), " {0} ".format(heroIcon(Hero.MOIRA)), "B Tier Hero", "Moira", HudPosition.LEFT, -100, rgba(230,105,64,255), rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.MOIRA, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Coalescense
    hudText(getPlayersOnHero(Hero.MOIRA, Team.ALL), "", "{0} Ultimate | Coalescense".format(abilityIconString(Hero.MOIRA,Button.ULTIMATE)), "  Ultimate Cost Decreased from 2380 to 1300", HudPosition.LEFT, -96, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "orisa information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.ORISA]) >= 1

    hudText(getPlayersOnHero(Hero.ORISA, Team.ALL), " {0} ".format(heroIcon(Hero.ORISA)), "C Tier Hero", "Orisa", HudPosition.LEFT, -100, rgba(240,188,47,255), rgba(255,255,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.ORISA, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Fortify
    hudText(getPlayersOnHero(Hero.ORISA, Team.ALL), "", "{0} Ability 1 | Fortify".format(abilityIconString(Hero.ORISA,Button.ABILITY_1)), "  Cooldown Decreased from 10.0 to 7.5 seconds", HudPosition.LEFT, -98, Color.WHITE, rgba(255,255,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Supercharger
    hudText(getPlayersOnHero(Hero.ORISA, Team.ALL), "", "{0} Ultimate | Supercharger".format(abilityIconString(Hero.ORISA,Button.ULTIMATE)), "  Ultimate Cost Decreased from 1680 to 1100", HudPosition.LEFT, -97, Color.WHITE, rgba(255,255,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "pharah information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.PHARAH]) >= 1

    hudText(getPlayersOnHero(Hero.PHARAH, Team.ALL), " {0} ".format(heroIcon(Hero.PHARAH)), "B Tier Hero", "Pharah", HudPosition.LEFT, -100, rgba(2,173,205,255), rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    
rule "reaper information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.REAPER]) >= 1

    hudText(getPlayersOnHero(Hero.REAPER, Team.ALL), " {0} ".format(heroIcon(Hero.REAPER)), "A Tier Hero", "Reaper", HudPosition.LEFT, -100, rgba(211,205,195,255), rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.REAPER, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Hellfire Shotgun
    hudText(getPlayersOnHero(Hero.REAPER, Team.ALL), "", "{0} Primary | Hellfire Shotguns".format(abilityIconString(Hero.REAPER,Button.PRIMARY_FIRE)), "  Damage Decreased from 1.8-6 to 1.65-5.5 per pellet", HudPosition.LEFT, -98, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Wraith Form
    hudText(getPlayersOnHero(Hero.REAPER, Team.ALL), "", "{0} Ability 1 | Wraith Form".format(abilityIconString(Hero.REAPER,Button.PRIMARY_FIRE)), "  Cooldown Increased from 8.0 to 10.0 seconds", HudPosition.LEFT, -97, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Death Blossom
    hudText(getPlayersOnHero(Hero.REAPER, Team.ALL), "", "{0} Ultimate | Death Blossom".format(abilityIconString(Hero.REAPER,Button.ULTIMATE)), "  Damage Decreased from 510 to 467.5 per person\n  Ultimate Cost Decreased from 2100 to 1800", HudPosition.LEFT, -96, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "reinhardt information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.REINHARDT]) >= 1

    hudText(getPlayersOnHero(Hero.REINHARDT, Team.ALL), " {0} ".format(heroIcon(Hero.REINHARDT)), "B Tier Hero", "Reinhardt", HudPosition.LEFT, -100, rgba(204,194,185,255), rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.REINHARDT, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Barrier Field
    hudText(getPlayersOnHero(Hero.REINHARDT, Team.ALL), "", "{0} Secondary | Barrier Field".format(abilityIconString(Hero.REINHARDT,Button.SECONDARY_FIRE)), "  Health Decreased from 1600 to 1000\n  Regeneration Rate Decreased from 200 to 50 per second", HudPosition.LEFT, -97, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Earthshatter
    hudText(getPlayersOnHero(Hero.REINHARDT, Team.ALL), "", "{0} Ultimate | Earthshatter".format(abilityIconString(Hero.REINHARDT,Button.ULTIMATE)), "  Ultimate Cost Decreased from 1540 to 1400", HudPosition.LEFT, -95, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "roadhog information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.ROADHOG]) >= 1

    hudText(getPlayersOnHero(Hero.ROADHOG, Team.ALL), " {0} ".format(heroIcon(Hero.ROADHOG)), "A Tier Hero", "Roadhog", HudPosition.LEFT, -100, rgba(228,180,12,255), rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.ROADHOG, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Base
    hudText(getPlayersOnHero(Hero.ROADHOG, Team.ALL), "", "{0} Base".format(iconString(Icon.HEART)), "  Health Decreased from 600 to 500", HudPosition.LEFT, -98, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Scrap Gun
    hudText(getPlayersOnHero(Hero.ROADHOG, Team.ALL), "", "{0} Primary/Secondary | Scrap Gun".format(abilityIconString(Hero.ROADHOG,Button.PRIMARY_FIRE)), "  Damage Decreased from 1.8-6.6/50 to 1.53-5.1/42.5 per pellet", HudPosition.LEFT, -97, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Take A Breather
    hudText(getPlayersOnHero(Hero.ROADHOG, Team.ALL), "", "{0} Ability 2 | Take A Breather".format(abilityIconString(Hero.ROADHOG,Button.ABILITY_2)), "  Healing Amount Decreased from 300 to 100", HudPosition.LEFT, -95, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Whole Hog
    hudText(getPlayersOnHero(Hero.ROADHOG, Team.ALL), "", "{0} Ultimate | Whole Hog".format(abilityIconString(Hero.ROADHOG,Button.ULTIMATE)), "  Damage Decreased From 7.0 to 2.2 per pellet\n  Ultimate Cost Decreased from 2240 to 1850", HudPosition.LEFT, -94, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "sigma information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.SIGMA]) >= 1

    hudText(getPlayersOnHero(Hero.SIGMA, Team.ALL), " {0} ".format(heroIcon(Hero.SIGMA)), "B Tier Hero", "Sigma", HudPosition.LEFT, -100, rgba(88,122,148,255), rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.SIGMA, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Gravitic Flux
    hudText(getPlayersOnHero(Hero.SIGMA, Team.ALL), "", "{0} Ultimate | Gravitic Flux".format(abilityIconString(Hero.SIGMA,Button.ULTIMATE)), "  Ultimate Cost Decreased from 1960 to 1650", HudPosition.LEFT, -96, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "soldier: 76 information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.SOLDIER]) >= 1

    hudText(getPlayersOnHero(Hero.SOLDIER, Team.ALL), " {0} ".format(heroIcon(Hero.SOLDIER)), "S Tier Hero", "Soldier", HudPosition.LEFT, -100, rgba(206,5,4,255), rgba(255,127,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.SOLDIER, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Base
    hudText(getPlayersOnHero(Hero.SOLDIER, Team.ALL), "", "{0} Base".format(iconString(Icon.HEART)), "  Health Increased from 200 to 225", HudPosition.LEFT, -98, Color.WHITE, rgba(255,127,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Biotic Field
    hudText(getPlayersOnHero(Hero.SOLDIER, Team.ALL), "", "{0} Ability 2 | Biotic Field".format(abilityIconString(Hero.SOLDIER,Button.ABILITY_2)), "  Total Healing Decreased from 175 to 70", HudPosition.LEFT, -97, Color.WHITE, rgba(255,127,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Tactical Visor
    hudText(getPlayersOnHero(Hero.SOLDIER, Team.ALL), "", "{0} Ultimate | Tactical Visor".format(abilityIconString(Hero.SOLDIER,Button.ULTIMATE)), "  Ultimate Cost Decreased from 2310 to 1800", HudPosition.LEFT, -96, Color.WHITE, rgba(255,127,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "sombra information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.SOMBRA]) >= 1

    hudText(getPlayersOnHero(Hero.SOMBRA, Team.ALL), " {0} ".format(heroIcon(Hero.SOMBRA)), "B Tier Hero", "Sombra", HudPosition.LEFT, -100, rgba(156,66,189,255), rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.SOMBRA, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Machine Pistol
    hudText(getPlayersOnHero(Hero.SOMBRA, Team.ALL), "", "{0} Primary | Machine Pistol".format(abilityIconString(Hero.SOMBRA,Button.PRIMARY_FIRE)), "  Damage Increased from 2.4-8 to 2.5-8.3 per pellet", HudPosition.LEFT, -98, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Hack
    hudText(getPlayersOnHero(Hero.SOMBRA, Team.ALL), "", "{0} Secondary | Hack".format(abilityIconString(Hero.SOMBRA,Button.SECONDARY_FIRE)), "  Cooldown Increased from 8.0/4.0/2.0 to 10.0/5.0/2.5 seconds", HudPosition.LEFT, -97, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Stealth
    hudText(getPlayersOnHero(Hero.SOMBRA, Team.ALL), "", "{0} Ability 1 | Stealth".format(abilityIconString(Hero.SOMBRA,Button.ABILITY_1)), "  Cooldown Decreased from 6.0 to 5.0 seconds\n  Limited by a Stealth Value", HudPosition.LEFT, -96, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Translocator
    hudText(getPlayersOnHero(Hero.SOMBRA, Team.ALL), "", "{0} Ability 2 | Translocator".format(abilityIconString(Hero.SOMBRA,Button.ABILITY_2)), " Cooldown Increased from 6.0 to 10.0 seconds", HudPosition.LEFT, -95, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #EMP
    hudText(getPlayersOnHero(Hero.SOMBRA, Team.ALL), "", "{0} Ultimate | EMP".format(abilityIconString(Hero.SOMBRA,Button.ULTIMATE)), "  Grants Sombra 100 Temporary Shield\n  Ultimate Cost Decreased from 1400 to 950", HudPosition.LEFT, -94, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "symmetra information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.SYMMETRA]) >= 1

    hudText(getPlayersOnHero(Hero.SYMMETRA, Team.ALL), " {0} ".format(heroIcon(Hero.SYMMETRA)), "B Tier Hero", "Symmetra", HudPosition.LEFT, -100, rgba(0,227,244,255), rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.SYMMETRA, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Photon Barrier
    hudText(getPlayersOnHero(Hero.SYMMETRA, Team.ALL), "", "{0} Ultimate | Photon Barrier".format(abilityIconString(Hero.SYMMETRA,Button.ULTIMATE)), "  Ultimate Cost Decreased from 1680 to 1100", HudPosition.LEFT, -98, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "torbjorn information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.TORBJORN]) >= 1

    hudText(getPlayersOnHero(Hero.TORBJORN, Team.ALL), " {0} ".format(heroIcon(Hero.TORBJORN)), "C Tier Hero", "Tobjorn", HudPosition.LEFT, -100, rgba(237,63,47,255), rgba(255,255,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.TORBJORN, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Deploy Turret
    hudText(getPlayersOnHero(Hero.TORBJORN, Team.ALL), "", "{0} Ability 1 | Deploy Turret".format(abilityIconString(Hero.TORBJORN,Button.ABILITY_1)), "  Can be used once throughout the entire round", HudPosition.LEFT, -98, Color.WHITE, rgba(255,255,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Molten Core
    hudText(getPlayersOnHero(Hero.TORBJORN, Team.ALL), "", "{0} Ultimate | Molten Core".format(abilityIconString(Hero.TORBJORN,Button.ULTIMATE)), "  Ultimate Cost Decreased from 2142 to 1400", HudPosition.LEFT, -97, Color.WHITE, rgba(255,255,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "tracer information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.TRACER]) >= 1

    hudText(getPlayersOnHero(Hero.TRACER, Team.ALL), " {0} ".format(heroIcon(Hero.TRACER)), "A Tier Hero", "Tracer", HudPosition.LEFT, -100, rgba(252,132,0,255), rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.TRACER, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Blink
    hudText(getPlayersOnHero(Hero.TRACER, Team.ALL), "", "{0} Ability 1 | Blink".format(abilityIconString(Hero.TRACER,Button.ABILITY_1)), "  Cooldown Increased from 3.0 to 4.0 seconds", HudPosition.LEFT, -97, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Pulse Bomb
    hudText(getPlayersOnHero(Hero.TRACER, Team.ALL), "", "{0} Ultimate | Pulse Bomb".format(abilityIconString(Hero.TRACER,Button.ULTIMATE)), "  Ultimate Cost Decreased from 1260 to 1200", HudPosition.LEFT, -96, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "widowmaker information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.WIDOWMAKER]) >= 1

    hudText(getPlayersOnHero(Hero.WIDOWMAKER, Team.ALL), " {0} ".format(heroIcon(Hero.WIDOWMAKER)), "A Tier Hero", "Widowmaker", HudPosition.LEFT, -100, rgba(133,156,234,255), rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.WIDOWMAKER, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Base
    hudText(getPlayersOnHero(Hero.WIDOWMAKER, Team.ALL), "", "{0} Base".format(iconString(Icon.HEART)), "  Health Increased from 175 to 200", HudPosition.LEFT, -98, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Widow's Kiss
    hudText(getPlayersOnHero(Hero.WIDOWMAKER, Team.ALL), "", "{0} Primary | Widow's Kiss".format(abilityIconString(Hero.WIDOWMAKER,Button.PRIMARY_FIRE)), "  Scoped Damage Increased from 6-12/60-120 to 8-16/80-160", HudPosition.LEFT, -97, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Grappling Hook
    hudText(getPlayersOnHero(Hero.WIDOWMAKER, Team.ALL), "", "{0} Ability 1 | Grappling Hook".format(abilityIconString(Hero.WIDOWMAKER,Button.ABILITY_1)), "  Cooldown Decreased from 12.0 to 10.0 seconds", HudPosition.LEFT, -96, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Venom Mine
    hudText(getPlayersOnHero(Hero.WIDOWMAKER, Team.ALL), "", "{0} Ability 2 | Venom Mine".format(abilityIconString(Hero.WIDOWMAKER,Button.ABILITY_2)), "  Cooldown Decreased from 15.0 to 10.0 seconds", HudPosition.LEFT, -95, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Infra-Sight
    hudText(getPlayersOnHero(Hero.WIDOWMAKER, Team.ALL), "", "{0} Ultimate | Infra-Sight".format(abilityIconString(Hero.WIDOWMAKER,Button.ULTIMATE)), "  Duration Decreased from 15.0 to 10.0 seconds\n  Ultimate Cost Decreased from 1540 to 750", HudPosition.LEFT, -94, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "winston information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.WINSTON]) >= 1

    hudText(getPlayersOnHero(Hero.WINSTON, Team.ALL), " {0} ".format(heroIcon(Hero.WINSTON)), "A Tier Hero", "Winston", HudPosition.LEFT, -100, rgba(111,122,160,255), rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.WINSTON, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Tesla Cannon
    hudText(getPlayersOnHero(Hero.WINSTON, Team.ALL), "", "{0} Primary | Tesla Cannon".format(abilityIconString(Hero.WINSTON,Button.PRIMARY_FIRE)), "  Damage Increased from 60 to 75 per second\n  Clip Size Decreased from 100 to 50", HudPosition.LEFT, -97, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Jump Pack
    hudText(getPlayersOnHero(Hero.WINSTON, Team.ALL), "", "{0} Ability 1 | Jump Pack".format(abilityIconString(Hero.WINSTON,Button.ABILITY_1)), "  Damage Increased from 1-50 to 1.25-62.5", HudPosition.LEFT, -96, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Barrier Projector
    hudText(getPlayersOnHero(Hero.WINSTON, Team.ALL), "", "{0} Ability 2 | Barrier Projector".format(abilityIconString(Hero.WINSTON,Button.ABILITY_2)), "  Cooldown Decreased from 12.0 to 10.0 seconds", HudPosition.LEFT, -95, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Primal Rage
    hudText(getPlayersOnHero(Hero.WINSTON, Team.ALL), "", "{0} Ultimate | Primal Rage".format(abilityIconString(Hero.WINSTON,Button.ULTIMATE)), "  Charges from taking damage, not dealing damage\n  Damage Increased from 40 to 50 per swing\n  Health Decreased from 1000 to 900", HudPosition.LEFT, -94, Color.WHITE, rgba(255,191,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "wrecking ball information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.HAMMOND]) >= 1

    hudText(getPlayersOnHero(Hero.HAMMOND, Team.ALL), " {0} ".format(heroIcon(Hero.HAMMOND)), "C Tier Hero", "Hammond", HudPosition.LEFT, -100, rgba(223,162,85,255), rgba(255,255,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.HAMMOND, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Base
    hudText(getPlayersOnHero(Hero.HAMMOND, Team.ALL), "", "{0} Base".format(iconString(Icon.HEART)), "  Health Decreased from 600 to 450", HudPosition.LEFT, -98, Color.WHITE, rgba(255,255,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Minefield
    hudText(getPlayersOnHero(Hero.HAMMOND, Team.ALL), "", "{0} Ultimate | Minefield".format(abilityIconString(Hero.HAMMOND,Button.ULTIMATE)), "  Ultimate Cost Decreased from 1540 to 1100", HudPosition.LEFT, -92, Color.WHITE, rgba(255,255,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "zarya information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.ZARYA]) >= 1
    
    hudText(getPlayersOnHero(Hero.ZARYA, Team.ALL), " {0} ".format(heroIcon(Hero.ZARYA)), "B Tier Hero", "Zarya", HudPosition.LEFT, -100, rgba(253,70,165,255), rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.ZARYA, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Particle Barrier
    hudText(getPlayersOnHero(Hero.ZARYA, Team.ALL), "", "{0} Ability 1 | Particle Barrier".format(abilityIconString(Hero.ZARYA,Button.ABILITY_2)), "  Particle Barrier Cooldown Decreased from 10.0 to 8.0 seconds", HudPosition.LEFT, -97, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Projected Barrier
    hudText(getPlayersOnHero(Hero.ZARYA, Team.ALL), "", "{0} Ability 2 | Projected Barrier".format(abilityIconString(Hero.ZARYA,Button.ABILITY_2)), "  Disabled", HudPosition.LEFT, -96, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Graviton Surge
    hudText(getPlayersOnHero(Hero.ZARYA, Team.ALL), "", "{0} Ultimate | Graviton Surge".format(abilityIconString(Hero.ZARYA,Button.ULTIMATE)), "  Ultimate Cost Decreased from 2100 to 1600", HudPosition.LEFT, -95, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

rule "zenyatta information hud":
    @Event global
    @Condition isGameInProgress()
    @Condition len([p for p in getAllPlayers() if p.getCurrentHero() == Hero.ZENYATTA]) >= 1
    
    hudText(getPlayersOnHero(Hero.ZENYATTA, Team.ALL), " {0} ".format(heroIcon(Hero.ZENYATTA)), "B Tier Hero", "Zenyatta", HudPosition.LEFT, -100, rgba(215,174,44,255), rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudSubtext(getPlayersOnHero(Hero.ZENYATTA, Team.ALL), " ", HudPosition.LEFT, -99, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Base
    hudText(getPlayersOnHero(Hero.ZENYATTA, Team.ALL), "", "{0} Base".format(iconString(Icon.HEART)), "  Health Increased from 50/150 to 75/175", HudPosition.LEFT, -98, Color.WHITE, rgba(255,255,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Orb of Destruction
    hudText(getPlayersOnHero(Hero.ZENYATTA, Team.ALL), "", "{0} Primary | Orb of Destruction".format(abilityIconString(Hero.ZENYATTA,Button.PRIMARY_FIRE)), "  Damage Decreased from 48/240 to 40/200", HudPosition.LEFT, -97, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    #Transcendence
    hudText(getPlayersOnHero(Hero.ZENYATTA, Team.ALL), "", "{0} Ultimate | Transcendence".format(abilityIconString(Hero.ZENYATTA,Button.ULTIMATE)), "  Ultimate Cost Decreased from 2310 to 1100", HudPosition.LEFT, -95, Color.WHITE, rgba(255,223,127,255), Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)