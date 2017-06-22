# Telemetría

La telemetría nos da puntos de vista a la partida. Nos da detalles de varios eventos que ocurrieron en la partida y donde ocurrieron. Algunos de los eventos también tienen una localización que pueden ser puestos en el mapa de juego
de Vainglory. Telemetría es muy útil para generar una vidualización de una línea de tiempo de cómo fue la partida para replays, o crear mapas de calor de donde un héroe o habilidad en especial es lo más útil. Estos son solo algunos ejemplos de dónde se puede utilizar telemetría.


> Conseguirás datos de telemetría como parte del endpoint de la partida.

> Y un mapa del Halcyon Fold [aquí!](https://cdn.discordapp.com/attachments/272249149473161216/284388441674874880/vainglory-map.png)

## Para conseguir datos de telemetría
 
Empiezas consiguiendo una lista de partidas utilizando el endpoint de partidas. 

La petición HTTP para conseguir partidas es
`GET https://api.dc01.gamelockerapp.com/shards/na/matches`

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/matches" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

```java
//Hay una variedad de librerías Java HTTP que soportan parámetros de pregunta.
```
```python
```
```ruby
```
```javascript
```
```go
```
> El comando arriba devuelve JSON estructurado de la siguiente manera:

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


> Tienes que buscar el nodo que lleva a telemetría. You need to look for Assets JSON node which points to telemetry. Busca por los siguientes en la respuesta:

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

> Cuando hayas encontrado esta ID, ahora tienes que buscar por el siguiente segmento JSON en el objeto respuesta. El siguiente objeto respuesta te dará un enlace a los datos de telemetría.

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

> Puedes descargar los datos con los siguientes comandos. Por favor ten en cuenta que **no debes** tener la Llave API para conseguir esta información.

```shell
curl "https://gl-prod-us-east-1.s3.amazonaws.com/assets/semc-vainglory/na/2017/03/17/00/43/b900c179-0aaa-11e7-bb12-0242ac110005-telemetry.json" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

```java
//Hay una variedad de librerías Java HTTP que soportan parámetros de pregunta.
```
```python
```
```ruby
```
```javascript
```
```go
```
> Esta petición devolverá una respuesta de la siguiente manera:

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

## Diccionario de Datos de Eventos
Datos de telemetría está clasificada en varios eventos de interés. Lo siguiente es una lista de cada tipo de evento con un ejemplo.

### PlayerFirstSpawn
Al principio de la partida cuando aparecen los jugadores.


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

### LevelUp
Cuando un jugador gana un nivel en el juego. En modos de juego Partida rápida, encontrarás 9 eventos en exactamente el mismo tiempo. 


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
Cuando un jugador compra un ítem.


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
Cuando un jugador vende un ítem.

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
Cuando un jugador pone un punto a uno de las habilidades. Por favor ten en cuenta que puede haber una diferencia de tiempo entre que un jugador gana un nivel y aprende una habilidad.

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
Este evento es registrado cuando un jugador utiliza una habilidad y tiene información sobre qué héroe lo utilizó junto con las coordenadas para el mapa. 

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
Este evento es registrado cuando un jugador utiliza un ítem activable o un charm/taunt.

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
Este evento es registrado cuando un jugador gana XP de cualquier fuente. Podría ser matar un minion, minero o un héroe.

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
Este evento es registrado cuando cualquier actor (jugador, torreta, minion, etc.) hace daño a cualquier otro.

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
Este evento es registrado cuando un jugador mata cualquier cosa en la partida. Puede ser un minion, minero o un héroe. Generalmente verás los eventos EarnXP y KillActor pasando al mismo tiempo.


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
Cuando un actor no-jugador mata a otro, como el Kraken o cuando un minion destruye una torreta.

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
Cuando un jugador gana oro de la destrucción de una torreta que pertenece al equipo contrario.

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
Cuando un jugador consigue oro de que su equipo captura el minero de oro.

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
Cuando un jugador consigue oro de que su equipo mata al Kraken capturado por el equipo enemigo.

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

Descarga muestras de datos de telemetría [aquí!](https://cdn.discordapp.com/attachments/272249149473161216/282627164053176320/telemetry_sample.tgz)
...

