# Telemetry

The telemetry provides us insights into the match. It gives us details of various events that happened in the match alongwith the time when they happened. Some of the events also have location which can be plotted on a Vainglory Game map. Telemetry is very useful to generate a timeline visualization of how the match went for replays, or create heatmaps of where a certain hero or ability is  most useful. These are just some of the examples of where Telemetry can be used.

> You will get telemetry data as part of the matches endpoint.

> And a map of the Halcyon Fold [here!](https://cdn.discordapp.com/attachments/272249149473161216/284388441674874880/vainglory-map.png)


## To get Telemetry data

You start by pulling a list of matches using the matches endopoint.

The HTTP Request to get matches is
`GET https://api.dc01.gamelockerapp.com/shards/na/matches`

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/matches" \
  -H "Authorization: Bearer <api-key>" \
  -H "Accept: application/vnd.api+json"
```

```java
//There are a variety of Java HTTP libraries that support query-parameters.
```
```python
```
```ruby
```
```javascript
```
```go
```
> The above command returns JSON structured like this:

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


> You need to look for Assets JSON node which points to telemetry. Check for the following in the response:

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

> Once you have located this ID, you now have to search for the following JSON segment in the response object. The following response object will provide you a link to the Telemetry data

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

> you can download the data with following commands. Please note that you **do not** need API Key to get this data.

```shell
curl "https://gl-prod-us-east-1.s3.amazonaws.com/assets/semc-vainglory/na/2017/03/17/00/43/b900c179-0aaa-11e7-bb12-0242ac110005-telemetry.json" \
  -H "Accept: application/vnd.api+json"
```

```java
//There are a variety of Java HTTP libraries that support query-parameters.
```
```python
```
```ruby
```
```javascript
```
```go
```
> this request will return you a response as follows:


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

## Event Data Dictionary
Telemetry data is classified into several events of interest. Following is a list of every event type with an example.

### General Event Info:

#### Team
In pre-match events teams will appear as ```1``` or ```2```, and in match events teams will apper as ```Left``` or ```Right``` side. Where ```1``` is ```Left``` side and ```2``` is ```Right``` side.

#### Position & TargetPosition
Positions for events are given in vectors holding three values. For example:

	[-17.51, 0.01, 41.63]

Where the first value represents the x coordinate, second value represents the z coordinate, and the third value represents the y coordinate. In other words, "Horizontal, Height, Vertical".

The following is a list of some of the most important positions on the map:

MAP LANDMARK COORDINATES

==LEFT SIDE==

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

==RIGHT SIDE==

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

==Miscellaneous==
Gold Miner / Kraken (0.00, 0.00. 23.60)
Elder Treant / Jungle Shop (0.20, 0.00, 42,00)
Compass Center (.092, 0.01, 3.33)
Map Center (0.00, 0.00, 0.00)

### Pre-Match Events
The following events will only take place pre-match, such as in hero selection.

#### HeroBan
Takes place when a hero has been banned, this event will only take place in draft mode.

	{
	    "time": "2017-06-17T18:19:52+0000",
	    "type": "HeroBan",
	    "payload": {
	        "Hero": "*Grumpjaw*",
	        "Team": "1"
	    }
	}

#### HeroSelect
Takes place when a hero has been selected by a player, ```Handle``` is the in-game name of the player.

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

#### HeroSkinSelect
Takes place when a player has selected a skin, this event will typically happen after hero select, if not at the same time, and might appear more then once if the skin is changed. A list of all hero skins is present in the [resources folder](https://github.com/madglory/gamelocker-vainglory/tree/master/resources).

	{
	    "time": "2017-06-26T04:58:29+0000",
	    "type": "HeroSkinSelect",
	    "payload": {
	        "Hero": "*Blackfeather*",
	        "Skin": "Blackfeather_Skin_Dynasty_T1"
	    }
	}

#### HeroSwap
Takes place when a player has swapped heroes with another player, this event will only take place in draft mode. Player is the player's unique id.

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

### Match Events
The following events will only take place during a match.

#### PlayerFirstSpawn
At the start of the game when a player spawns.

	{
		"time": "2017-03-17T00:38:32+0000",
		"type": "PlayerFirstSpawn",
		"payload": {
			"Team": "Right",
			"Actor": "*Alpha*"
		}
	}

#### LevelUp
When a player gains a level in the game. Depending on the game mode of the match, you will find multiple events at the exact same time for each player at the beginning of the match.


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

#### BuyItem
When a player buys an item. Pro-Tip: Position will help you determine which shop was used to buy the item.

	{
		"time": "2017-06-26T04:59:47+0000",
		"type": "BuyItem",
		"payload": {
			"Team": "Right",
			"Actor": "*Blackfeather*",
			"Item": "Book Of Eulogies",
			"Cost": 300,
			"RemainingGold:": 300,
			"Position": [
				83.22,
				1.5,
				0.72
			]
		}
	}

#### SellItem
When a player sells an item.

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

#### LearnAbility
When a player puts upgrades an ability. Pro-Tip: There can be a time difference between when a player levels up and upgrades an ability.

	{
		"time": "2017-03-17T00:38:52+0000",
		"type": "LearnAbility",
		"payload": {
			"Team": "Right",
			"Actor": "*Sayoc*",
			"Ability": "HERO_ABILITY_SAYOC_C",
			"Level": 1
		}
	}

#### UseAbility
This event is recorded when a player uses an ability and it will hold information about the hero who used it together with the coordinates for the map.

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
	}

#### UseItemAbility
This event is recorded when a player uses an activatable item or a charm/taunt.

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

#### EarnXP
This event is recorded when a player gains XP from any source. it could be killing a minion, miner or a hero. Pro-Tip: This event is not shown for XP trickle(XP gained per second of the match).
	
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
	}

#### DealDamage
This event is recorded when any actor (player, turret, minion, etc.) deals damage to any other.

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


#### KillActor
This event is recorded when a player kills anything in game. it could be a a minion, miner or a hero. You will generally see EarnXP and KillActor events come at the same time.

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
	}

#### NPCkillNPC
When one non-player actor kills another, such as the Kraken or a minion killing a turret.

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

#### Executed
When a non-player kills a player, such as Kraken or a minion killing a player.

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

#### GoldFromTowerKill
When a player earns gold from the destruction of a turret belonging to the enemy team.

	{
		"time": "2017-03-31T02:57:02+0000",
		"type": "GoldFromTowerKill",
		"payload": {
			"Team": "Left",
			"Actor": "*Idris*",
			"Amount": 300
		}
	}

#### GoldFromGoldMine
When a player earns gold from his or her team capturing the gold miner.

	{
		"time": "2017-03-31T03:00:43+0000",
		"type": "GoldFromGoldMine",
		"payload": {
			"Team": "Left",
			"Actor": "*Idris*",
			"Amount": 300
		}
	}

#### GoldFromKrakenKill
When a player earns gold from his or her team killing a Kraken released by the enemy team.

	{
		"time": "2017-03-31T03:07:43+0000",
		"type": "GoldFromKrakenKill",
		"payload": {
			"Team": "Right",
			"Actor": "*Kestrel*",
			"Amount": 500
		}
	}

Download a sample of telemetry data [here!](https://cdn.discordapp.com/attachments/272249149473161216/282627164053176320/telemetry_sample.tgz)
