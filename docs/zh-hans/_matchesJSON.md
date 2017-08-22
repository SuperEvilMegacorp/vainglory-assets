# ***Match Data Summary***

感谢Kashz贡献本文！GitHub: iAm-Kashif

## **Match Object**

| 变量 | 类型 | 描述 |
| :---: | :---: | :---: |
| type | str | 匹配类型 |
| id | str | 匹配 ID |
| createdAt | str (iso8601) | 游戏开始的时间 |
| duration | int | 以秒为单位游戏进行的时间 |
| gameMode | str | 游戏模式 |
| patchVersion | str | API版本 |
| shardId | str | Match Shard |
| stats | map | 参考 [Match.stats](#1) |
| assets | obj | 参考 [Match.assets](#2)  |
| rosters | obj | 参考 [Rosters](#3) |

### <a name="1"></a> **Match.stats** **(比赛统计)**

| 变量 | 类型 | 描述 |
| :---: | :---: |:---: |
| endGameReason | str | “胜利” 或 “失败” |
| queue | str | 游戏模式 |

### <a name="2"></a> **Match.assets** **(遥测数据（Telemetry Data）)**

| 变量 | 类型 | 描述 |
| :---: | :---: |:---: |
| type | string | 资源 |
| createdAt | str (iso8601) | 遥测数据（Telemtry）创建时间
| description | str | "" |
| filename | str | telemetry.json |
| id | str | 资源的ID |
| contentType | str | application/json |
| name | str | telemetry |
| url | str | 链接到Telemetry.json文件 |

## <a name="3"></a> **Rosters 对象**

| 变量 | 类型 | 描述 |
| :---: | :---: | :---: |
| id | str | Roster的ID |
| type | str | Roster
| participants | obj | 参考 [Participants](#4) |
| stats | obj | 参考 [Rosters.stats](#5) |
| team | obj | 参考 [Rosters.team](#6) |

### <a name="5"></a>**Rosters.stats**

| 变量 | 类型 |
| :---: | :---: |
| acesEarned | int |
| gold | int |
| heroKills | int |
| krakenCaptures | int |
| side | Either "right/red" or "left/blue" |
| turretKills | int |
| turretRemaining | int |

### <a name="6"></a>**Rosters.team**

| 变量 | 类型 | 描述 |
| :---: | :---: | :---: |
| id | str | 队伍的ID 或 为空 |
| name | str | 队伍的名字 或 为空 |
| type | str | 队伍（team） |

## <a name="4"></a>**Participants 对象**

| 变量 | 类型 | 描述 |
| :---: | :---: | :---: |
| actor | str | 英雄 |
| id | str | 与Roster相同的ID |
| player | obj | 参考 [Participants.player](#7)|
| stats | map | 参考 [Participants.stats](#8) |
| type | str | 参与者（participants） |

### <a name="7"></a>**Participants.player**

| 变量 | 类型 | 描述 |
| :---: | :---: | :---: |
| id | str | 玩家的UID |
| name | str | 玩家的IGN |
| stats | map | 参考 [Participants.player.stats](#9) |
| type | str | player |

### <a name="8"></a>**Participants.stats**

| 变量 | 类型 |
| :---: | :---: |
| assists | int |
| crystalMineCaptures | int |
| deaths | int |
| farm | int |
| firstAfkTime | int: -1表示无AFK行为 |
| goldMineCaptures | int |
| itemGrants | map of {itemsBought : int} |
| itemSells | map of {itemsSold : int} |
| itemUses | map of {itemsUsed : int} |
| items | 最终构建的列表（长度为6） |
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

| 变量 | 类型 | 
| :---: | :---: | 
| level | int |
| lifetimeGold | float |
| lossStreak | int |
| played | int |
| played\_ranked | int |
| winStreak | int |
| wins | int |
| xp | int |