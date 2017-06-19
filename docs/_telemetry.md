# Telemetry

The telemtry provides us insights into the match. It gives us details of various events that happened in the match alongwith the time when they happened. Some of the events also have location which can be plotted on a Vainglory Game map. Telemtry is very useful to generate a timeline visualtions of how the match went for replays, or create heatmaps of where a certin hero or ability is  most useful. These are just some of the exmaples of where Telemtry can be used.

> You will get telemtry data as part of the matches endpoint.

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

> Once you have located this ID, you now have to search for the following JSON segment in the response object. The following response object will provide you a link to the Telemtry data

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
Telemetry data is classified into several event of interest. Following is a list of every event type with an example.

### PlayerFirstSpawn
At the start of the game when players spawn.

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
When a player gains a level in the game. In game types Brawl, you will find 9 events at the exact same time.

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
When a player buys an item.

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
When a player sells an item.
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
When a player puts a point into one of the abilities. Please note there can be a time difference between when a player gains a level and learns an ability
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
This event is recorded when a player uses an ability and it will hold information about the hero who used it together with the co-ordinates for the map.
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
This event is recorded when a player uses an activatable item or a charm/taunt.
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
This event is recorded when a player gains XP from any source. it could be killing a minion, miner or a hero.
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
This event is recorded when any actor (player, turret, minion, etc.) deals damage to any other.
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
This event is recorded when a player kills anything in game. it could be a a minion, miner or a hero. You will generally see EarnXP and KillActor events come at the sme time.

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
When one non-player actor kills another, such as the Kraken or a minion killing a turret.
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

### GoldFromTowerKill
When a player earns gold from the destruction of a turret belonging to the enemy team.
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
When a player earns gold from his or her team capturing the gold miner.
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
When a player earns gold from his or her team killing a Kraken released by the enemy team.
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

Download sample telemetry data [here!](https://cdn.discordapp.com/attachments/272249149473161216/282627164053176320/telemetry_sample.tgz)

...
