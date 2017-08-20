This issue will keep track of all feature requests that are made as issues and are blocked for some reason or being worked on in regards to **Telemetry**. When an issue is blocked or unblocked this issue will be updated. If you wish to get an update on any of these issues you can check back here or leave a comment below. 

- [ ] Ability String Naming Is Inconsistent                **Status: In Progress**
- [ ] HeroBan is Missing Player                                 **Status: Pending**
- [ ] Team Naming Is Inconsistent                             **Status: Pending**
- [ ] Pause Event In Telemetry                                   **Status: Pending**
- [ ] Add Match Start Timestamp                              **Status: Pending**
- [ ] Assists in Telemetry                                            **Status: Pending**
- [ ] Blitz Coin Earned                                                **Status: Pending**
- [ ] Stacking Stats                                                    **Status: Pending**
- [ ] DealDamage for Turrets to Heroes                   **Status: Blocked**
- [ ] Amount of Energy when UseAbility                  **Status: Blocked**
- [ ] In-Lane Minion Kills                                            **Status: Blocked**
- [ ] Identify Critical Attacks                                      **Status: Blocked**
- [ ] KillActor missing for AI Kills                               **Status: Blocked**
- [ ] Rename the TankMinion                                     **Status: Blocked**
- [ ] HP Information                                                    **Status: Blocked**
- [ ] Revealed/Hidden Status                                     **Status: Blocked**
- [ ] Kill Bounties Not Showing                                  **Status: Blocked**
- [ ] Ambient Gold                                                      **Status: Blocked**
- [ ] Telemetry Kill Streaks and Ace                          **Status: Blocked**
- [ ] Add current itemization information                 **Status: Blocked**
- [ ] Add Pings to Telemetry                                      **Status: Blocked**
- [ ] Type of Damage                                                  **Status: Blocked**
- [ ] Position Data for Good Positional Analysis       **Status: Blocked**
- [ ] Gold Balance Over Time                                     **Status: Blocked**
- [ ] Telemetry KillActor gold                                     **Status: Blocked**
- [ ] Add Shared XP Hero in XPEarned typeData     **Status: Blocked**
- [ ] Add player respawn events                                 **Status: Blocked**
- [ ] Healing spells                                                       **Status: Blocked**
- [ ] Include Activatables                                             **Status: Blocked**

# In Progress
Here will be a list of all feature requests that are currently being worked on for future updates.

## Ability String Naming is Inconsistent 
Seen on: #189 
Solution in: #197 #222 
Example:
```
{
    "Ability__Grace__A": "Grace A",
    "Ability__Grace__AltAttack": "Grace AA",
    "Ability__Grace__B": "Grace B",
    "Ability__Grace__DefaultAttack": "Grace AA",
    "HERO_ABILITY_HERO042_A_NAME": "Grace A",
    "HERO_ABILITY_HERO042_B_NAME": "Grace B",
    "HERO_ABILITY_HERO042_C_NAME": "Grace C",
    "Ability__B_Bounce": "Ozo B",
    "AbilityB_Bounce": "Ozo B",
    "Ability__B_EndingAttack": "Ozo B",
    "AbilityCLeapOff": "Idris C",
    "Ability_Dash": "Vox A",
    "Ability_Grumpjaw_Eat": "Grumpjaw C",
    "Ability__Idris__A_Blink": "Idris A",
    "Ability__Idris__A_Dash": "Idris A",

    "*Item_Flaregun*": "Flare Gun",

    "Armor2": "Coat of Plates",

    "Candy - VO Taunt": "Voice over Taunt"
}
```
# Pending
Here will be a list of all feature requests that have not been designated a Status.

## Add Match Start Timestamp
Knowing when the match actually starts would be helpful in correlating event time in the telemetry with that shown on the match timer in-game (replays, recordings, broadcasts). Right now, they do not agree.
Seen on: #213
Example:
```
To Be Added
```

## Pause Event in Telemetry 
Extremely important as currently in game time is determined using the time stamp therefore when a game is paused the timing is not correct.
Seen on: #167
Example:
```
{ "time": "2017-05-03T01:26:27+0000", "type": "pause", "payload": { "onOff": "paused", "Actor": "*Kestrel*" } }

{ "time": "2017-05-03T01:26:27+0000", "type": "pause", "payload": { "onOff": "continue", "Actor": "*Kestrel*" } }
```

## Blitz Coins Earned
Seen on #214 
It would be a great asset to be able to use the API to see how many Blitz Coins a player has at the end of each Blitz match and how they earned it in the Telemetry. Additionally, a team's Blitz coins should be a roster stats attribute.
Example:
```
{ "time": "2017-05-03T01:26:27+0000", "type": "BlitzCoinEarned", "payload": { "Team": "Left", "Actor": "*Kestrel*", "Balance": 2 } }
```

## HeroBan is Missing Player 
Seen on: #182
Example:
```
  {
    "time": "2017-06-08T07:25:09+0000",
    "type": "HeroSelect",
    "payload": {
      "Hero": "*Lance*",
      "Team": "1",
      "Player": "4c75f332-6b5d-11e4-aef9-06641bcbf424",
      "Handle": "lensjo"
    }
  },
```

## Team Naming is Inconsistent 
Seen on: #181
Example:
```
In HeroBan and HeroSelect, Team is either "1" or "2" (strings, not integers). LevelUp has Team as either "Right" or "Left". Also "Hero" instead of "Actor"
```

## Item/Ability Stacks
Seen on #208 
Certain Items and abilities stack that apply stacks on damage or lose without any damage.
Example: 
```
{ "time": "2017-05-03T01:26:27+0000", "type": "itemStack", "payload": { "Team": "Left", "Actor": "*Skye*", "Item": "Broken Myth", "currentStacks" : "7" } }

{ "time": "2017-05-03T01:26:27+0000", "type": "abilityStack", "payload": { "Team": "Left", "Actor": "*Saw*", "Ability": "Saw_Perk", "currentStacks" : "12" } }
```

## Assists in Telemetry 
Seen On: #207
Example:
```
 {
    "time": "2017-04-22T15:39:56+0000",
    "type": "KillActor",
    "payload": {
      "Team": "Left",
      "Actor": "*Taka*",
       "Assist": "*Lyra*",
      "Killed": "*Lyra*",
      "KilledTeam": "Right"
      "Gold": "0",
      "IsHero": 1,
      "TargetIsHero": 1,
      "Position": [
        -74.13,
        0.4,
        23.16
      ]
    }
  },
```

# Blocked
Here will be a list of all feature requests that are currently blocked.

## Deal Damage For AI(Turrets/Kraken/Minders/Minions/Jungle Monsters
Seen on #75 
Damage done by AI is extremely crucial for analysis. How much damage can a minion take from a turret at X time in a game etc...
Example: 
```
To Be Added
```

## Amount of Energy when UseAbility 
Seen on: #70
Example:
```
{ "time": "2017-02-18T12:55:46+0000", "type": "UseAbility", "payload": { "Team": "Left", "Actor": "*Phinn*", "Ability": "HERO_ABILITY_PHINN_A_NAME", "Position": [ -43.50, 0.00, 30.50 ] } }
```

## Identify Critical Attacks
Seen on: #63
Example:
```
{ "time": "2017-02-18T12:55:24+0000", "type": "DealDamage", "payload": { "Team": "Left", "Actor": "*SAW*", "Target": "*Glaive*", "Source": "Unknown", "criticalHit": "1", Damage": 53, "Delt":  41, "IsHero": 1, "TargetIsHero": 1 } }
```

## KillActor Missing For AI Kills
Can we please add in the ability to show when a lane minion dies from a lane minion or a turret. This would allow us to determine the efficiency of teams farming and understand how much gold is being lost and what the causes are.
Seen on: #60
Example:
```
To Be Added
```

### Rename the TankMinion
I am hoping to have the name of the tankMinions be changed to say TankMinion1 and TankMinion2. Knowing the precise minion which was killed allows us to know and determine how efficient a player farms. It can allow us to analyze much more in depth, about whether a player is focusing damage correctly in order to farm efficiently and is getting those last hits efficiently.
Seen on: #53
Example:
```
To Be Added
```

## HP Information
The player takes damage it shows how much damage done, but doesn't show the heroes max hp or his current hp, his health regen, potion regen, fountain regen? Furthermore, maybe Lyra healing, Adagio healing.
Seen o: #48
Example:
```
To Be Added
```

## Revealed/Hidden Status
Can we have abilities or flares indicate when a hero is revealed and its position when it is revealed. For example, we can have a scout trap and determine the usefulness of a scout trap by determing which position of a trap provided the most amount of help. For example here, Gwen A causes heroes to be revealed for a short duration can we please have that shown and show where the enemy is while flared or revealed.
Issue: #46
Example:
```
{
    "time": "2017-01-25T00:56:43+0000",
    "type": "reveal",
    "payload": {
        "Team": "Left",
        "Actor": "*Gwen*",
        "Target": "*Taka*",
        "Source": "Ability__Gwen__A",
        "Position": "xxx"
    }
}
{
    "time": "2017-01-25T00:56:43+0000",
    "type": "reveal",
    "payload": {
        "Team": "Left",
        "Actor": "*Lyra*",
        "Target": "*Taka*",
        "Source": "Flare",
        "Position": "xxx"
    }
}
```

## Kill Bounties Not Showing  
Seen on: #45
Example:
```
{
    "time": "2017-01-25T00:59:05+0000",
    "type": "KillActor",
    "payload": {
        "Team": "Right",
        "Actor": "*Rona*",
        "Killed": "*Reim*",
        "KilledTeam": "Left",
        "Gold": "200",
        "killBounty": "100"
        "IsHero": 1,
        "TargetIsHero": 1,
        "Position": [-9.80, 0.01, 37.12]
    }
} 
```

## Ambient Gold
Seen on: #42
Example:
```
 "time": "2017-01-25T00:56:38+0000",
 "type": "KillActor",
 "payload": {
     "Team": "Right",
     "Actor": "*Hero016*",
     "Killed": "*Neutral_JungleMinion_DefaultSmall*",
     "KilledTeam": "Neutral",
     "Gold": "22",
      "ambientGoldTarget": "Ardan"
      "ambientGoldAmount:" "15"
     "IsHero": 1,
     "TargetIsHero": 0,
     "Position": [9.20, 0.01, 32.02]
 }
```

## Add Pings to Telemetry  
Seen on: #143
Example:
```
To Be Added
```

## Type of Damage  
If its possible, divide the damage by crystal, weapon or true, burn etc
Seen on: #123
Example:
```
{ "time": "2017-02-18T12:55:24+0000", "type": "DealDamage", "payload": { "Team": "Left", "Actor": "*SAW*", "Target": "*Glaive*", "Source": "Unknown", "criticalHit": "1", "type":"weapon", Damage": 53, "Delt":  41, "IsHero": 1, "TargetIsHero": 1 } }
```

## Not Enough Position Data for Good Positional Analysis  
In particular, positions are only reported when some event other than motion transpires (purchases, damage, item uses, leveling up, etc.). So for example, a player can run across the map and then hit a monster, and we have no data about where they are the entire time they're running until they hit the monster on the opposite end of the map. Thus there are long patches of missing motion data.
Seen on: #118
Example:
```
To Be Added
```

## Gold Balance Over Time  
There is no data about gold in the participant's type. I would like to get some stats about gold@time but the only time telemetry is giving lifetimeGold is when someone levels up. I cant pull total gold from every minute of the game since players stop leveling up around ~13min. And I cant calculate from reward gold because then I would be skipping ambient gold and cs gold.
Seen on: #117
Example:
```
gold: 5, balance: 25, ambient: 12
```

## Telemetry KillActor Gold  
KillActor in TargetIsHero:1 is returning Gold: 0
Seen on: #144
Example:
```
{ "time": "2017-04-10T05:57:31+0000", "type": "KillActor", "payload": { "Team": "Right", "Actor": "Ozo", "Killed": "Glaive", "KilledTeam": "Left", "Gold": "0", "IsHero": 1, "TargetIsHero": 1, "Position": [ -6.35, 0.01, 26.80 ] } },
```

##  Add Shared XP hero in XPEarned type data   
For the XPEarned type data, could you also add hero which shares the XP earned when killing a neutral minion?
Seen on: #127
Example:
```
To Be Added
```

## Add Player Respawn Events
As is, it's not possible to tell when players are alive or dead. While there are death events, there are not respawn events. We can narrow it down from other events, but not get an exact respawn time, as far as I can tell. (But I'm glad to be proven wrong on this, especially since it's 2am here...)
Seen on: #125
Example:
```
To Be Added
```

## Healing Spells   
Include healing values for spells and fountain and maybe perks? We should be able to calculate how much heal was done
Seen on: #122
Example:
```
To Be Added
```

## Include Activatables   
Include when an activable was used e.g. Trap placed, Flare threw from here to there, Fountain used, Crucible used...
Issue: #121
Example:
```
To Be Added
```

# List of Features That Will Not Be Possible
Below is a list of requests that were made but were not able to be done for some reason.
 
## Add current itemization information
Seen on: #184
Reason: I don't know that this makes a lot of sense. I understand the accounting is a pain, but bloating the telemetry with info that's already included is probably not a great solution. 
Alternative Solution: Have the item information in the itemDB, then you will be able to map which item is consumable or not and price.