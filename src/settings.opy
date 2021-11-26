#!mainFile "main.opy"

settings {
    "main": {
        "description": "{VWZQ2} Overwatch Battle Royale v1.13.0 ||| Battle against 9 other players in a FFA styled gamemode. Last player standing wins. Full of hero balances. ||| Created By u/Ender#15291 //             Join The Discord: bit.ly/ENDERSWORKSHOP //           More Information: workshop.codes/overwatch-br",
        "modeName": "Overwatch Battle Royale v1.13.0"
    },
    "lobby": {
        "allowPlayersInQueue": true,
        "mapRotation": "afterGame",
        "enableMatchVoiceChat": true,
        "ffaSlots": 10,
        "returnToLobby": "never"
    },
    "gamemodes": {
        "ffa": {
            "enabledMaps": [
                "blizzWorld",
                "blizzWorldWinter",
                "eichenwalde",
                "eichenwaldeHalloween",
                "hanamura",
                "hanamuraWinter",
                "kanezaka",
                "lijiangGarden",
                "lijiangGardenLny",
                "lijiangControlCenter",
                "lijiangControlCenterLny",
                "volskaya",
                "oasisCityCenter",
                "horizonLunarColony"
            ]
        },
        "general": {
            "gamemodeStartTrigger": "manual",
            "healthPackRespawnTime%": 125,
            "heroLimit": "off",
            "spawnHealthPacks": "enabled"
        }
    },
    "heroes": {
        "allTeams": {
            "ana": {
                "health%": 112.5,
                "ultGen%": 175
            },
            "ashe": {
                "health%": 112.5,
                "ultGen%": 165.925
            },
            "baptiste": {
                "health%": 125,
                "ability2Cooldown%": 1,
                "ultGen%": 256.666
            },
            "bastion": {
                "secondaryFireRechargeRate%": 50,
                "ultGen%": 144.375
            },
            "brigitte": {
                "secondaryFireRechargeRate%": 29.412,
                "ability1Cooldown%": 150,
                "ultGen%": 200
            },
            "dva": {
                "secondaryFireRechargeRate%": 50,
                "health%": 83.333,
                "ultGen%": 90.588
            },
            "doomfist": {
                "secondaryFireCooldown%": 150,
                "ultGen%": 120
            },
            "echo": {
                "ultGen%": 163.333
            },
            "genji": {
                "ultGen%": 138
            },
            "hanzo": {
                "ability2Quantity%": 4,
                "ultGen%": 105
            },
            "junkrat": {
                "ultGen%": 96.25
            },
            "lucio": {
                "ability2Cooldown%": 150,
                "healingReceived%": 56.91,
                "ultGen%": 217.777
            },
            "mccree": {
                "damageDealt%": 85,
                "ultGen%": 152.727
            },
            "mei": {
                "primaryFireFreezeDuration%": 76,
                "primaryFireFreezeMinimum%": 20,
                "primaryFireFreezeRate%": 70,
                "ultFreezeMinimum%": 75,
                "ultFreezeRate%": 15,
                "ultGen%": 107.333
            },
            "mercy": {
                "damageDealt%": 110,
                "ultGen%": 179.411
            },
            "moira": {
                "ultGen%": 183.076
            },
            "orisa": {
                "ability1Cooldown%": 75,
                "ultGen%": 152.727
            },
            "pharah": {
                "ultGen%": 110.526
            },
            "reaper": {
                "damageDealt%": 91.666,
                "ability1Cooldown%": 125,
                "ultGen%": 116.666
            },
            "reinhardt": {
                "health%": 62.5,
                "secondaryFireRechargeRate%": 25,
                "ultGen%": 110
            },
            "roadhog": {
                "damageDealt%": 77.28,
                "health%": 83.333,
                "ultGen%": 124.444
            },
            "sigma": {
                "ultGen%": 118.787
            },
            "soldier": {
                "healingReceived%": 40,
                "health%": 112.5,
                "ultGen%": 135.882
            },
            "sombra": {
                "damageDealt%": 104.166,
                "secondaryFireCooldown%": 125,
                "ability1Cooldown%": 83.33,
                "ability2Cooldown%": 166.67,
                "ultGen%": 147.368
            },
            "symmetra": {
                "ultGen%": 152.727
            },
            "torbjorn": {
                "ultGen%": 153
            },
            "tracer": {
                "ability1Cooldown%": 125,
                "ultGen%": 105
            },
            "widowmaker": {
                "health%": 114.285,
                "ability1Cooldown%": 83.333,
                "ability2Cooldown%": 66.667,
                "ultDuration%": 66.667,
                "ultGen%": 205.333
            },
            "winston": {
                "ammoClipSize%": 50,
                "ability2Cooldown%": 84.615,
                "damageDealt%": 125,
                "combatUltGen%": 0,
            },
            "hammond": {
                "health%": 75,
                "ultGen%": 140
            },
            "zarya": {
                "ability1Cooldown%": 80,
                "enableAbility2": false,
                "ultGen%": 131.25
            },
            "zenyatta": {
                "damageDealt%": 83.333,
                "ultGen%": 210
            },
            "disabledHeroes": [
            ],
            "general": {
                "enableSpawningWithUlt": false,
                "ultGen%": 100,
                "combatUltGen%": 100,
                "passiveUltGen%": 83.333
            }
        }
    }
}