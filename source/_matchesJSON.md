# ***Match JSON Breakdown***

Special thanks to Kashz for creating this! GitHub: iAm-Kashif

### **Match Object:**

| Variable | Type | Description |
| :---: | :---: | :---: |
| type | str | Match |
| id | str | Match ID |
| createdAt | str in iso8601 | Time of Match Played |
| duration | int | Time of match in seconds |
| gameMode | str | Game Mode |
| patchVersion | str | Version of API |
| region | str | Region of match |
| stats | map | [See Match.stats](#1) |
| assets | obj | [See Match.assets](#2)  |
| rosters | obj | [See Rosters](#3) |

### <a name="1"></a>**[1] Match.stats:** **(End of game statistics)**

| Variable | Description |
| :---: | :---: |
| endGameReason | "Victory" or "Defeat" |
| queue | Game Mode |

### <a name="2"></a>**[2] Match.assets:** **(Telemetry Data)**

| Variable | Type | Description |
| :---: | :---: |
| type | string | asset |
| createdAt | str in iso8601 format | Time of Telemtry creation
| description | str | "" |
| filename | str | telemetry.json |
| id | str | ID of Asset |
| contentType | str | application/json |
| name | str | telemetry |
| url | str | Link to Telemetry.json file |

### <a name="3"></a>**[3] Rosters Object: **

| Variable | Type | Description |
| :---: | :---: | :---: |
| id | str | ID of Roster |
| type | str | Roster
| participants | obj | [Check Rosters.participants](#6) |
| stats | obj | [Check Rosters.stats](#7) |
| team | obj | [Check Rosters.team](#8) |

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
