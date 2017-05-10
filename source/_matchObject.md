# ***Over-the-Glance view of Match Object***

### **Match Object:**

| Variable/Method | dataType | Description |
| :---: | :---: | :---: |
| createdAt | str in iso8601 | Time of Match Played |
| duration | int | Time of match in seconds |
| gameMode | str | Game Mode |
| Id | str | ID of match |
| key\_id | str | ID of match |
| patchVersion | str |   |
| region | str |   |
| stats | dict | [Check Match.stats](#1) |
| assets | obj | [Check Match.assets](#2)  |
| rosters | obj | [Check  Match.Rosters](#3) |
| type\_name | str | Usually &#39;match&#39; |
|   |   |   |
| describe() | Method | [Check Match.describe()](#4) |
| to\_dict() | Method | [Check Match.to\_dict()](#5) |
|   |   |   |

### <a name="1"></a>**[1] Match.stats:** **(End of game statistics)**

| Variable/Method | Description |
| :---: | :---: |
| EndGameReason | &#39;Victory&#39; or &#39;Defeat&#39; |
| queue | Type of gameMode being played |
|   |   |

### <a name="2"></a>**[2] Match.assets:** **(Telemetry Data)**

| Variable/Method | Description |
| :---: | :---: |
| content\_type | Usually &#39;application/json&#39; |
| created\_at | str in iso8601 format |
| description | Usually &#39;&#39; |
| filename | Usually &#39;telemetry.json&#39; |
| id | ID of Asset |
| key\_id | Same as ID of Asset |
| name | Usually &#39;telemetry&#39; |
| type\_name | Usually &#39;asset&#39; |
| url | Link to Telemetry.json file |

### <a name="3"></a>**[3] Rosters Object: (Match.Rosters)**

| id | str | ID of Roster |
| :---: | :---: | :---: |
| key\_id | str | Same as ID of Roster |
| participants | obj | [Check Rosters.participants](#6) |
| stats | obj | [Check Rosters.stats](#7) |
| team | obj | [Check Rosters.team](#8) |
| type\_name | str | Always &#39;roster&#39; |
|   |   |   |
| describe() | Method | [Check Rosters.describe()](#9) |

### <a name="4"></a>**[4] Match.describe()**: **(Schema of Object)**

| Variable/Method | Description |
| :---: | :---: |
| type | Usually &#39;match&#39; |
| attributes: <ul><li>createdAt</li> <li>duration</li> <li>gameMode</li> <li>patchVersion</li> <li>region</li> <li>stats</li></ul> |   |
| relationships:  |   |

### <a name="5"></a>**[5] Match.to\_dict():**

| Variable/Method | Description |
| :---: | :---: |
| id | ID of match |
| type | Usually &#39;match&#39; |
| attributes: <ul><li>createdAt</li> <li>duration</li> <li>gameMode</li> <li>patchVersion</li> <li>stats</li></ul> |  for stats: [Check Match.stats](#1)  |


### <a name="6"></a>**[6] Rosters.participants:** **(Len: 3)**

| Variable/Method | Description |
| :---: | :---: |
| actor | str |
| id | Same as ID of Roster |
| key\_id | Same as ID of Roster |
| player | [Check Rosters.participants.player](#10)|
| stats | [Check Rosters.participants.stats](#11) |
| type\_name | Usually &#39;participant&#39; |



### <a name="7"></a>**[7] Rosters.stats:**
| Variable/Method | Description |
| :---: | :---: |
| AcesEarned | int |
| gold | int |
| heroKills | int |
| krakenCaptures | int |
| Side | Either &#39;Left/blue&#39; or &#39;Right/red&#39; |
| turretKills | int |
| turretRemaining | int |

### <a name="8"></a>**[8] Rosters.team:**
| Variable/Method | Description |
| :---: | :---: |
| id | ID of Team or None |
| key\_id | ID of Team or None |
| name | Name of Team or None |
| type\_name | Usually &#39;team&#39; |

### <a name="9"></a>**[9] Rosters.describe(): (Schema of Object)**

| Variable/Method | Description |
| :---: | :---: |
| type | Usually &#39;roster |
| attributes:namevalue-typeis-requiredis-read-onlyis-write-only |  &#39;stats&#39;&#39;dict&#39;&#39;False&#39;&#39;False&#39;&#39;False&#39; |
| relationships:namevalue-typeis-requiredis-read-onlyis-write-only |  &#39;team&#39;&#39;team&#39;&#39;False&#39;&#39;False&#39;&#39;False&#39; |

### <a name="10"></a>**[10] Rosters.participants.player:**

| Variable/Method | Description |
| :---: | :---: |
| id | UID of player |
| key\_id | Same as UID of player |
| name | IGN of player |
| stats | [Check Rosters.participants.player.stats](#12) |
| type\_name | Usually &#39;player&#39; |

### <a name="11"></a>**[11] Rosters.participants.stats:**

| Variable/Method | Description |
| :---: | :---: |
| assists | int |
| crystalMineCaptures | int |
| deaths | int |
| farm | int |
| firstAfkTime | int: -1 for no AFK |
| goldMineCaptures | int |
| itemGrants | dict of {itemsBought : int} |
| itemSells | dict of {itemsSold : int} |
| itemUses | dict of {itemsUsed : int} |
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

### <a name="12"></a>**[12] Rosters.participants.player.stats: (Len: 8)**

| Variable/Method | Description |
| :---: | :---: |
| level | int |
| lifetimeGold | float |
| lossStreak | int |
| played | int |
| played\_ranked | int |
| winStreak | int |
| wins | int |
| xp | int |

--------------------------------------
                                     Discord: Kashz#7553 | VG IGN: Kashz | GitHub: iAm-Kashif