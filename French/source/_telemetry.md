# Télémétrie

La télémétrie nous fournit des informations sur le match. Elle nous donne des détails sur divers événements qui se sont produits dans le match avec le moment où ils se sont produits. Certains événements ont également une position qui peut être tracée sur une carte de jeu Vainglory. La Télémétrie est très utile pour générer des représentations de la chronologie de la façon dont le match s'est déroulé pour les répétitions, ou créer des plans d’un héros ou une capacité afin de savoir où elle a été le plus utile. Ce ne sont que quelques-uns des exemples où la télémétrie peut être utilisé.



> Vous obtiendrez des données de télémétrie dans le cadre du point final des matchs.

> Et une carte du Halcyon Fold ici! [here!](https://cdn.discordapp.com/attachments/272249149473161216/284388441674874880/vainglory-map.png)


## Pour obtenir des données de télémétrie

Vous commencez par extraire une liste de matches en utilisant les correspondances endopoint.

La requête HTTP pour obtenir des résultats est `GET https://api.dc01.gamelockerapp.com/shards/na/matches`

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/matches" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

```java
//Il existe une variété de bibliothèques Java HTTP qui prennent en charge les paramètres de requête
```
```python
```
```ruby
```
```javascript
```
```go
```
> La commande ci-dessus renvoie JSON structuré comme celle-ci:

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


> Vous devez rechercher le noeud JSON d'actifs qui indique la télémétrie. Vérifiez ce qui suit dans la réponse:

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

> Une fois que vous avez localisé cette ID, vous devez maintenant rechercher le segment JSON suivant dans l'objet de réponse. L'objet de réponse suivant vous fournira un lien vers les données télémétrique

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

> Vous pouvez télécharger les données avec les commandes suivantes. Veuillez noter que vous n'avez pas besoin de clé API pour obtenir ces données.

```shell
curl "https://gl-prod-us-east-1.s3.amazonaws.com/assets/semc-vainglory/na/2017/03/17/00/43/b900c179-0aaa-11e7-bb12-0242ac110005-telemetry.json" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

```java
//Il existe une variété de bibliothèques Java HTTP qui prennent en charge les paramètres de requête
```
```python
```
```ruby
```
```javascript
```
```go
```
> Cette demande vous renverra une réponse comme suit


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
## Dictionnaire de données d'événement
Les données de télémétrie sont classées en plusieurs événements d'intérêt. Voici une liste de chaque type d'événement avec un exemple.

### PlayerFirstSpawn
Au début du jeu lorsque les joueurs apparaissent

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
Quand un joueur gagne un niveau dans le jeu. Dans les types de jeux Brawl, vous trouverez 9 événements au même moment.

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
Quand un joueur achète un article.

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
Quand un joueur vend un article.
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
Quand un joueur met un point dans l'une des capacités. Notez qu'il peut y avoir une différence de temps entre le moment où un joueur gagne un niveau et apprend une capacité.
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
Cet événement est enregistré lorsqu'un joueur utilise une capacité et des informations sur le héros qui l'a utilisé seront fournis avec les coordonnées de la carte.
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
Cet événement est enregistré lorsqu'un joueur utilise un élément activable ou un charme/insultant.
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
Cet événement est enregistré lorsqu'un joueur gagne de l’XP à partir de n'importe quelle source. Cela pourrait être tuer un minion, un mineur ou un héros.
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
Cet événement est enregistré lorsque n'importe quel acteur (joueur, tourelle, mineur, etc.) inflige des dégats à d'autres.
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
Cet événement est enregistré lorsqu'un joueur tue n'importe quoi dans le jeu. Cela peut être un mineur, un mineur ou un héros. Vous verrez généralement que les événements EarnXP et KillActor surviennent au même moment 

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
Quand un acteur non joueur tue un autre, comme le Kraken ou un mineur qui tue une tourelle.
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
Quand un joueur reçoit de l'or de la destruction d'une tourelle appartenant à l'équipe ennemie.
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
Quand un joueur obtient de l'or de son équipe capturant le mineur d'or.
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
Quand un joueur obtient de l'or de son équipe qui tue un Kraken capturé par l'équipe ennemie.
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

Téléchargez les exemples de données de télémétrie [ici!](https://cdn.discordapp.com/attachments/272249149473161216/282627164053176320/telemetry_sample.tgz)

...