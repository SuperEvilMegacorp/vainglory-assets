# ***Resumen de datos de partidas***

Muchas gracias a Kashz por ayudar a crear esto! GitHub: iAm-Kashif

## **Objeto de partida**

| Variable | Tipo | Descripción |
| :---: | :---: | :---: |
| type | str | Partida |
| id | str | ID de partida |
| createdAt | str (iso8601) | Tiempo de la partida jugada |
| duration | int | Tiempo de la partida en segundos |
| gameMode | str | Modo de juego |
| patchVersion | str | Versión del API |
| region | str | Región de la partida |
| stats | map | Vea [Match.stats](#1) |
| assets | obj | Vea [Match.assets](#2)  |
| rosters | obj | Vea [Rosters](#3) |


### <a name="1"></a> **Match.stats** **(Estatísticas de fin de la partida)**

| Variable | Tipo | Descripción |
| :---: | :---: |:---: |
| endGameReason | str | "Victory" o "Defeat" |
| queue | str | Modo de juego |

### <a name="2"></a> **Match.assets** **(Datos de telemetría)**

| Variable | Type | Descripción |
| :---: | :---: |:---: |
| type | string | Activo |
| createdAt | str (iso8601) | Tiempo de la creación de telemetría
| description | str | "" |
| filename | str | telemetry.json |
| id | str | ID del activo |
| contentType | str | application/json |
| name | str | telemetría |
| url | str | Archivo de Enlaces de Telemetry.json |

## <a name="3"></a> **Objeto listas**

| Variable | Tipo| Descripción |
| :---: | :---: | :---: |
| id | str | ID de lista |
| type | str | Lista
| participants | obj | Vea [Participants](#4) |
| stats | obj | Vea [Rosters.stats](#5) |
| team | obj | Vea [Rosters.team](#6) |

### <a name="5"></a>**Rosters.stats**

| Variable | Type |
| :---: | :---: |
| acesEarned | int |
| gold | int |
| heroKills | int |
| krakenCaptures | int |
| side | O "right/red" o "left/blue" |
| turretKills | int |
| turretRemaining | int |

### <a name="6"></a>**Rosters.team**
| Variable | Tipo | Descripción 
| :---: | :---: | :---: |
| id | str | ID del equipo o nada|
| name | str | Nombre de equipo o nada |
| type | str | Equipo |

## <a name="4"></a>**Participante Objeto**

| Variable | Tipo | Descripción |
| :---: | :---: | :---: |
| actor | str | Hero |
| id | str | Mismo al ID de la lista|
| player | obj |Vea [Participants.player](#7)|
| stats | map |Vea [Participants.stats](#8) |
| type | str | Participantes |

### <a name="7"></a>**Participants.player**

| Variable | Tipo |Descripción |
| :---: | :---: | :---: |
| id | str | UID de jugador |
| name | str | IGN de jugador |
| stats | map | Vea [Participants.player.stats](#9) |
| type | str | jugador |

### <a name="8"></a>**Participants.stats**

| Variable |Tipo |
| :---: | :---: |
| assists | int |
| crystalMineCaptures | int |
| deaths | int |
| farm | int |
| firstAfkTime | int: -1 para no AFK |
| goldMineCaptures | int |
| itemGrants | mapa de {itemsBought : int} |
| itemSells | mapa de {itemsSold : int} |
| itemUses | mapa de {itemsUsed : int} |
| items | lista de la build final (Len: 6) |
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