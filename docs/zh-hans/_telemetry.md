# 遥测（telemtry）

# Telemetry

"遥测"技术可以让我们对匹配赛内发生的一切一窥究竟。它可以告诉我们比赛内发生的各种事件，以及它们发生时的具体具体时间。其中有一些事件提供有位置信息，这就意味着可以把事件绘制到Vainglory游戏地图上。“遥测”技术对于生成“时间线”是有很大帮助的，“时间线”可以将游戏replay的进程可视化，它的另一个实用用途是用于制作某个英雄或某个技能的热图（heatmap）。而这仅仅是“遥测”技术的几种可能的用途。

> 遥测数据将作为匹配端点的一部分被传送

> 以及 海希安城的地图 [这里！]

## 遥测数据的获取

使用匹配端点来获取匹配列表。

用于获取匹配的HTTP请求是：

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/matches" \
  -H "Authorization: Bearer <api-key>" \
  -H "Accept: application/vnd.api+json"
```

```java
//很多Java HTTP库都支持参数请求方式
```
```python
```
```ruby
```
```javascript
```
```go
```

> 上面的命令返回的JSON看起来如下：

```json
  "data": [
    {
      "type": "match",
      "id": "f5373c40-0aa9-11e7-bcff-0667892d829e",
      "attributes": {
        "createdAt": "2017-03-17T00:38:00Z",
        "duration": 259,
        "gameMode": "blitz_pvp_ranked",
        "patchVersion": "",
        "shardId": "na",
        "stats": {
          "endGameReason": "victory",
          "queue": "blitz_pvp_ranked"
        },
        "titleId": "semc-vainglory"
      },
      "relationships": {
        "assets": {
          "data": [
            {
              "type": "asset",
              "id": "b900c179-0aaa-11e7-bb12-0242ac110005"
            }
          ]
        },
        "rosters": {
          "data": [
            {
              "type": "roster",
              "id": "b8f6640a-0aaa-11e7-bb12-0242ac110005"
            },
            {
              "type": "roster",
              "id": "b8f65271-0aaa-11e7-bb12-0242ac110005"
            }
          ]
        },
        "rounds": {
          "data": []
        }
      }
    },
 ```

> 您需要找到Json节点“Assets”定位遥测数据，参考下方的服务器响应：

```json
      "relationships": {
        "assets": {
          "data": [
            {
              "type": "asset",
              "id": "b900c179-0aaa-11e7-bb12-0242ac110005"
            }
          ]
        },
```

> 找到这个ID后，再到响应对象中找到如下JSON片段。下方的相应对象提供了获取遥测数据的连接

```json
    {
      "type": "asset",
      "id": "b900c179-0aaa-11e7-bb12-0242ac110005",
      "attributes": {
        "URL": "https://gl-prod-us-east-1.s3.amazonaws.com/assets/semc-vainglory/na/2017/03/17/00/43/b900c179-0aaa-11e7-bb12-0242ac110005-telemetry.json",
        "contentType": "application/json",
        "createdAt": "2017-03-17T00:43:22Z",
        "description": "",
        "filename": "telemetry.json",
        "name": "telemetry"
      }
    },
```
> 使用下方的命令下载数据，注意您 **无需** API key 就可以下载。

```shell
curl "https://gl-prod-us-east-1.s3.amazonaws.com/assets/semc-vainglory/na/2017/03/17/00/43/b900c179-0aaa-11e7-bb12-0242ac110005-telemetry.json" \
  -H "Accept: application/vnd.api+json"
```

```java
//有很多Java HTTP库支持参数化请求
```
```python
```
```ruby
```
```javascript
```
```go
```

> 该请求的响应结果如下：

```json  
   { "time": "2017-02-18T06:37:15+0000",
     "type": "DealDamage",
     "payload": {
       "Team": "Left",
       "Actor": "*Ringo*",
       "Target": "*Turret*",
       "Source": "Unknown",
       "Damage": 405,
       "Delt":  613,
       "IsHero": 1,
       "TargetIsHero": 0
     }
   }
```

## 事件数据字典（Dictionary）

遥测数据根据需求的不同分为以下几种类型。下面列出了所有事件类型同时附带了一个示例。


### 一般事件信息:

#### 团队（Team）
在比赛准备阶段时间中团队将以 ```1``` 或 ```2```的形式出现，在比赛进行时的事件中，团队的形式将变为 ```Left``` 或 ```Right```。其中```1``` 指 ```Left```边，```2``` 指 ```Right```边。

#### 位置 & 目标位置
事件中的位置以矢量的形式展现，例如：

	[-17.51, 0.01, 41.63]

其中第一个值表示x坐标，第二个值为z坐标，第三个值为y坐标，换句话说，“长，宽， 高”。

以下列出一些重要的地图位置：

MAP LANDMARK COORDINATES

==LEFT SIDE 左边==

Base Shop (-88.50, 0.89, 2.00)

Crystal (-76.12, 0.00, 19.90)

Turret 5 (-75.48, 0.00, 11.96)
Turret 4 (-68.59, 0.00, 19.97)
Turret 3 (-54.00, 0.00, 2.92)
Turret 2 (-35.78, 0.00, 1.17)
Turret 1 (-17.06, 0.00, 1.93)

Top Healer (-40.92, 0.00, 20.25)

Backs 1 (-43.42, 0.00, 31.11)
Backs 2 (-45, 0.00, 32.23)

Crystal Miner (-35.19, 0.00, 36.03)

Mid Healer (-21.95, 0.00, 24.00)

Fronts 1 (-14.40, 0.00, 37.67)
Fronts 2 (-12.51, 0.00, 37.67)

==RIGHT SIDE 右边==

Base Shop (88.57, 1.80, 0.51)

Crystal (76.12, 0.10, 19.90)

Turret 5 (75.48, 0.00, 11.96)
Turret 4 (68.59, 0.00, 19.97)
Turret 3 (54.00, 0.00, 2.92)
Turret 2 (35.78, 0.00, 1.17)
Turret 1 (17.06, 0.00, 1.93)

Top Healer (40.59, 0.00, 20.75)

Backs 1 (43.49, 0.00, 31.28)
Backs 2 (45.60, 0.00, 32.40)

Crystal Miner (35.20, -0.00, 35.87)

Mid Healer (22.50, 0.00, 23.50)

Fronts 1 (14.85, 0.00, 38.12)
Fronts 2 (12.89. 0.00, 36.74)

==Miscellaneous 其他==
Gold Miner / Kraken (0.00, 0.00. 23.60)
Elder Treant / Jungle Shop (0.20, 0.00, 42,00)
Compass Center (.092, 0.01, 3.33)
Map Center (0.00, 0.00, 0.00)

### 比赛准备阶段时间
以下事件只在比赛准备阶段出现，比如选择英雄。

#### 英雄禁选
当英雄被禁选时发生，此事件只在征召模式中出现。

	{
	    "time": "2017-06-17T18:19:52+0000",
	    "type": "HeroBan",
	    "payload": {
	        "Hero": "*Grumpjaw*",
	        "Team": "1"
	    }
	}

#### 英雄选择
当玩家选择英雄时发生，```Handle```是玩家在游戏中的名字。

	{
	    "time": "2017-06-26T04:58:29+0000",
	    "type": "HeroSelect",
	    "payload": {
	        "Hero": "*Blackfeather*",
	        "Team": "2",
	        "Player": "cc4069da-982b-11e4-9bf4-06eb725f8a76",
	        "Handle": "CrownNorth"
	    }
	}

#### 选择英雄皮肤
玩家选择皮肤是发生，此事件通常在选择英雄后发生，或同时发生，并且可能出现多次如果进行皮肤更换。所有英雄皮肤列表可参考[resources folder](https://github.com/madglory/gamelocker-vainglory/tree/master/resources).

	{
	    "time": "2017-06-26T04:58:29+0000",
	    "type": "HeroSkinSelect",
	    "payload": {
	        "Hero": "*Blackfeather*",
	        "Skin": "Blackfeather_Skin_Dynasty_T1"
	    }
	}

#### 英雄切换
玩家相互兑换英雄时发生，此事件只在征召模式中发生。Player是玩家的唯一ID。

	{
		"time": "2017-06-13T06:41:38+0000",
		"type": "HeroSwap",
		"payload": [
			{
				"Hero": "*Glaive*",
				"Team": "2",
				"Player": "85d05694-2ab2-11e5-8d94-06f4ee369f53"
			},
			{
				"Hero": "*Catherine*",
				"Team": "2",
				"Player": "292e51d6-9640-11e4-a597-06eb725f8a76"
			}
		]
	}

### 比赛事件
以下事件只在比赛进行时发生。

### PlayerFirstSpawn

游戏开始，玩家出现时记录。

```json
  {
    "time": "2017-03-17T00:38:32+0000",
    "type": "PlayerFirstSpawn",
    "payload": {
      "Team": "Right",
      "Actor": "*Alpha*"
    }
  }
```

### Level Up

玩家等级上升时记录。在Brawl游戏类型中，您将会同时找到9个事件。

```json
  {
    "time": "2017-03-17T00:38:32+0000",
    "type": "LevelUp",
    "payload": {
      "Team": "Right",
      "Actor": "*Alpha*",
      "Level": 1,
      "LifetimeGold": 0
    }
  }
```

### BuyItem

玩家购买装备时记录。

```json
  {
    "time": "2017-03-17T00:38:45+0000",
    "type": "BuyItem",
    "payload": {
      "Team": "Left",
      "Actor": "*Vox*",
      "Item": "Breaking Point",
      "Cost": 2600
    }
  }
```

### SellItem

玩家出售装备时记录。

```json
  {
    "time": "2017-03-31T02:49:37+0000",
    "type": "SellItem",
    "payload": {
      "Team": "Left",
      "Actor": "*Lyra*",
      "Item": "Flare",
      "Cost": 15
    }
  }
```

### LearnAbility

玩家给技能加点时记录。请注意玩家升级和为技能加点之间的时间间隔可能不是固定的。

```json
  {
    "time": "2017-03-17T00:38:52+0000",
    "type": "LearnAbility",
    "payload": {
      "Team": "Right",
      "Actor": "*Sayoc*",
      "Ability": "HERO_ABILITY_SAYOC_C",
      "Level": 1
    }
  },
```

### UseAbility

当玩家使用技能时记录。其中事件内包含了使用技能的英雄，以及使用技能时所在的地图坐标点的位置。

```json
 {
    "time": "2017-03-17T00:39:08+0000",
    "type": "UseAbility",
    "payload": {
      "Team": "Right",
      "Actor": "*Kestrel*",
      "Ability": "HERO_ABILITY_KESTREL_A_NAME",
      "Position": [
        39.39,
        0.01,
        27.26
      ]
    }
  },
```

### UseItemAbility

当玩家使用物品技能或魅力表演时记录。

```json
  {
    "time": "2017-03-31T03:10:17+0000",
    "type": "UseItemAbility",
    "payload": {
      "Team": "Left",
      "Actor": "*Lyra*",
      "Ability": "Travel Boots",
      "Position": [
        -17.51,
        0.01,
        41.63
      ],
      "TargetActor": "None",
      "TargetPosition": [
        -17.51,
        0.01,
        41.63
      ]
    }
  }
```

### EarnXP

当玩家以任意手段获取经验时被记录，经验的来源可能是杂兵，金矿或英雄。高级提示：此事件不会被XP trickle（比赛中每秒的经验增长值）记录。

```json
  {
    "time": "2017-03-17T00:39:09+0000",
    "type": "EarnXP",
    "payload": {
      "Team": "Left",
      "Actor": "*Koshka*",
      "Source": "*JungleMinion_TreeEnt*",
      "Amount": 67,
      "Shared With": 1
    }
  },
```

### DealDamage

当任意单位（玩家、炮塔、兵矿等等）对其他单位造成伤害时记录。

```json
  {
    "time": "2017-03-31T02:47:34+0000",
    "type": "DealDamage",
    "payload": {
      "Team": "Left",
      "Actor": "*Skaarf*",
      "Target": "*Vox*",
      "Source": "Unknown",
      "Damage": 105,
      "Delt": 80,
      "IsHero": 1,
      "TargetIsHero": 1
    }
 }
```

### KillActor

当玩家单位杀死任意其他单位时记录。杀死的可能是杂兵，兵矿或敌方英雄。基本上您可以同时收到EarnXP和KillActor事件。

```json
  {
    "time": "2017-03-17T00:39:09+0000",
    "type": "KillActor",
    "payload": {
      "Team": "Left",
      "Actor": "*Koshka*",
      "Killed": "*JungleMinion_TreeEnt*",
      "KilledTeam": "Neutral",
      "Gold": "80",
      "IsHero": 1,
      "TargetIsHero": 0,
      "Position": [
        -21.95,
        0,
        24
      ]
    }
  },
```

### NPCkillNPC

当非玩家角色杀死另一个时即被记录，例如海怪克拉肯或杂兵摧毁了炮塔。

```json
  {
    "time": "2017-03-31T03:07:21+0000",
    "type": "NPCkillNPC",
    "payload": {
      "Team": "Left",
      "Actor": "*Kraken_Captured*",
      "Killed": "*Turret*",
      "KilledTeam": "Right",
      "Gold": "300",
      "IsHero": 0,
      "TargetIsHero": 0,
      "Position": [
        54,
        0,
        2.92
      ]
    }
  }
```

#### Executed
当玩家被非玩家伤害所杀死时，如被克拉肯或小兵杀死时.

	{
	    "time": "2017-06-13T06:43:40+0000",
	    "type": "Executed",
	    "payload": {
	        "Team": "Left",
	        "Actor": "*JungleMinion_TreeEnt*",
	        "Killed": "*Samuel*",
	        "KilledTeam": "Left",
	        "Gold": "0",
	        "IsHero": 0,
	        "TargetIsHero": 1,
	        "Position": [
	            -41.82,
	            0.01,
	            27.02
	        ]
	    }
	}

### GoldFromTowerKill

当玩家由于敌方炮塔被摧毁而获得金币时记录。

```json
  {
    "time": "2017-03-31T02:57:02+0000",
    "type": "GoldFromTowerKill",
    "payload": {
      "Team": "Left",
      "Actor": "*Idris*",
      "Amount": 300
    }
  }
```

### GoldFromGoldMine

当玩家所在队伍占领金矿而获得金币时记录。

```json
  {
    "time": "2017-03-31T03:00:43+0000",
    "type": "GoldFromGoldMine",
    "payload": {
      "Team": "Left",
      "Actor": "*Idris*",
      "Amount": 300
    }
  }
```

### GoldFromKrakenKill

当玩家所在队伍击杀敌方队伍释放的克拉肯而获得金币时记录。

```json
  {
    "time": "2017-03-31T03:07:43+0000",
    "type": "GoldFromKrakenKill",
    "payload": {
      "Team": "Right",
      "Actor": "*Kestrel*",
      "Amount": 500
    }
  }
```

下载遥感样例数据 [这里！](https://cdn.discordapp.com/attachments/272249149473161216/282627164053176320/telemetry_sample.tgz)

...
