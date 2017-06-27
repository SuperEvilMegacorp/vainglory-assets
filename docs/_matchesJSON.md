# ***Match Data Summary***

Special thanks to Kashz for helping to create this! GitHub: iAm-Kashif

## **Match Object**

| Variable | Type | Description |
| :---: | :---: | :---: |
| type | str | Match |
| id | str | Match ID |
| createdAt | str (iso8601) | Time of Match Played |
| duration | int | Time of match in seconds |
| gameMode | str | Game Mode |
| patchVersion | str | Version of API |
| shardId | str | Match Shard |
| stats | map | See [Match.stats](#1) |
| assets | obj | See [Match.assets](#2)  |
| rosters | obj | See [Rosters](#3) |

### <a name="1"></a> **Match.stats** **(End of game statistics)**

| Variable | Type | Description |
| :---: | :---: |:---: |
| endGameReason | str | "Victory" or "Defeat" |
| queue | str | Game Mode |

### <a name="2"></a> **Match.assets** **(Telemetry Data)**

| Variable | Type | Description |
| :---: | :---: |:---: |
| type | string | asset |
| createdAt | str (iso8601) | Time of Telemtry creation
| description | str | "" |
| filename | str | telemetry.json |
| id | str | ID of Asset |
| contentType | str | application/json |
| name | str | telemetry |
| url | str | Link to Telemetry.json file |

## <a name="3"></a> **Rosters Object**

| Variable | Type | Description |
| :---: | :---: | :---: |
| id | str | ID of Roster |
| type | str | Roster
| participants | obj | See [Participants](#4) |
| stats | obj | See [Rosters.stats](#5) |
| team | obj | See [Rosters.team](#6) |

### <a name="5"></a>**Rosters.stats**
| Variable | Type |
| :---: | :---: |
| acesEarned | int |
| gold | int |
| heroKills | int |
| krakenCaptures | int |
| side | Either "right/red" or "left/blue" |
| turretKills | int |
| turretRemaining | int |

### <a name="6"></a>**Rosters.team**
| Variable | Type | Description 
| :---: | :---: | :---: |
| id | str | ID of Team or None |
| name | str | Name of Team or None |
| type | str | team |

## <a name="4"></a>**Participants Object**

| Variable | Type | Description |
| :---: | :---: | :---: |
| actor | str | Hero |
| id | str | Same as ID of Roster |
| player | obj |See [Participants.player](#7)|
| stats | map |See [Participants.stats](#8) |
| type | str | participants |

### <a name="7"></a>**Participants.player**

| Variable | Type |Description |
| :---: | :---: | :---: |
| id | str | UID of player |
| name | str | IGN of player |
| stats | map | See [Participants.player.stats](#9) |
| type | str | player |

### <a name="8"></a>**Participants.stats**

| Variable |Type |
| :---: | :---: |
| assists | int |
| crystalMineCaptures | int |
| deaths | int |
| farm | int |
| firstAfkTime | int: -1 for no AFK |
| goldMineCaptures | int |
| itemGrants | map of {itemsBought : int} |
| itemSells | map of {itemsSold : int} |
| itemUses | map of {itemsUsed : int} |
| items | list of final build (Len: 6) |
| jungleKills | int |
| karmaLevel | int |
| kills | int |
| krakenCaptures | int |
| level | int |
| minionKills | int |
| nonJungleMinionKills | int |
| skillTier | int |
| skinKey | str |
| turretCaptures | int |
| wentAfk | bool |
| winner | bool |

### <a name="9"></a> **Participants.player.stats**

| Variable | Type | 
| :---: | :---: | 
| level | int |
| lifetimeGold | float |
| lossStreak | int |
| played | int |
| played\_ranked | int |
| winStreak | int |
| wins | int |
| xp | int |
