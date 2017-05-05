# ***Sommaire Des Données De Correspondance***

Un grand merci à Kashz pour l’aide fourni à créer cela! GitHub: iAm-Kashif

## **Correspondance Des Matchs**

| Variable | Type | Description |
| :---: | :---: | :---: |
| type | str | Match |
| id | str | ID du Match |
| createdAt | str (iso8601) | Heure du match  |
| duration | int | Temps du match en secondes |
| gameMode | str | Mode de jeu |
| patchVersion | str | Version de l’API |
| region | str | Région du match |
| stats | map | Voir [Match.stats](#1) |
| assets | obj | Voir [Match.assets](#2)  |
| rosters | obj | Voir [Rosters](#3) |

### <a name="1"></a> **Match.stats** **(Statistique De Fin De Jeu)**

| Variable | Type | Description |
| :---: | :---: |:---: |
| endGameReason | str | “Victoire” ou “défaite” |
| queue | str | Mode de jeu |

### <a name="2"></a> **Match.assets** **(Données De Télémétrie)**

| Variable | Type | Description |
| :---: | :---: |:---: |
| type | string | Atouts |
| createdAt | str (iso8601) | Temps de création telemetrique
| description | str | "" |
| filename | str | telemetry.json |
| id | str | ID de l’atout  |
| contentType | str | application/json |
| name | str | Télémétrie  |
| url | str | Lien vers le fichier Telemetry.json |

## <a name="3"></a> **Objet De La Liste**

| Variable | Type | Description |
| :---: | :---: | :---: |
| id | str | ID De La Liste |
| type | str | Roster
| participants | obj | Voir [Participants](#4) |
| stats | obj | Voir [Rosters.stats](#5) |
| team | obj | Voir [Rosters.team](#6) |

### <a name="5"></a>**Rosters.stats**  (liste statistique)
| Variable | Type |
| :---: | :---: |
| acesEarned | int |
| gold | int |
| heroKills | int |
| krakenCaptures | int |
| side | Soit "right/red" ou "left/blue" |
| turretKills | int |
| turretRemaining | int |

### <a name="6"></a>**Rosters.team** (liste des équipes)
| Variable | Type | Description 
| :---: | :---: | :---: |
| id | str | ID de l'équipe ou rien |
| name | str | Nom de l'équipe ou non-existant |
| type | str | Équipe |

## <a name="4"></a>**Objets Des Participants**

| Variable | Type | Description |
| :---: | :---: | :---: |
| actor | str | Héros |
| id | str | Pareil que l’ID de la liste  |
| player | obj |Voir [Participants.player](#7)|
| stats | map |Voir [Participants.stats](#8) |
| type | str | participants |

### <a name="7"></a>**Participants.player**

| Variable | Type |Description |
| :---: | :---: | :---: |
| id | str | UID du joueur |
| name | str | IGN du joueur |
| stats | map | Voir [Participants.player.stats](#9) |
| type | str | joueur |

### <a name="8"></a>**Participants.stats**

| Variable |Type |
| :---: | :---: |
| assists | int |
| crystalMineCaptures | int |
| deaths | int |
| farm | int |
| firstAfkTime | int: -1 Pour pas AFK |
| goldMineCaptures | int |
| itemGrants | Carte de  {itemsBought : int} |
| itemSells | Carte de  {itemsSold : int} |
| itemUses | Carte de  {itemsUsed : int} |
| items | Liste de construction finale (Len: 6) |
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

### <a name="9"></a> **Participants.joueurs.statistiques**

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
