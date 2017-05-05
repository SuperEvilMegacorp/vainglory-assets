
# Records De Match


Les listes suivent les scores de chaque groupe adverse de participants. Si les joueurs entrent en matchmaking en équipe, la liste aura une équipe liée. Les listes ont de nombreux objet associé aux  Participants, un pour chaque membre de la liste. Les objets de liste n'ont de sens que dans le contexte d'une correspondance et ne sont pas exposés comme une ressource autonome.

## Liste Des Membres

```json
{
  "type": "roster",
  "id": "eca49808-d510-11e6-bf26-cec0c932ce01",
  "attributes": {
    "stats": {
      "acesEarned": 2,
      "gold": 32344,
      "etc..."
    }
  },
  "relationships": {
    "team": {
      "data": {
        "type": "team",
        "id": "753d464c-d511-11e6-bf26-cec0c932ce01"
      }
    },
    "participants": {
      "data": [
        {
          "type": "participant",
          "id": "eca49a7e-d510-11e6-bf26-cec0c932ce01"
        },
        "etc..."
      ]
    }
  }
}
```

Les records de matchs sont créés chaque fois que les joueurs terminent une session de jeu. Chaque match contient des informations de haut niveau sur la session de jeu, y compris des informations comme la durée, le mode de jeu et plus encore. Chaque match a deux listes.  

## Participants

```json
{
  "type": "participant",
  "id": "ea77c3a7-d44e-11e6-8f77-0242ac130004",
  "attributes": {
    "actor": "*Hero009*",
    "stats": {
      "assists": 4,
      "crystalMineCaptures": 1,
      "deaths": 2,
      "farm": 49.25,
      "etc..."
    }
  }
}
```
Les objets participants suivent chaque membre dans une liste. Les participants peuvent être des joueurs anonymes, des joueurs enregistrés ou des bots. Dans le cas où le Participant est un Joueur enregistré, le Participant aura une seule relation de Joueur. Les objets participants n'ont de sens que dans le contexte d'une correspondance et ne sont pas exposés comme une ressource autonome.

## Obtenez une collection de Matches

```shell
curl -g "https://api.dc01.gamelockerapp.com/shards/na/matches?sort=createdAt&page[limit]=3&filter[createdAt-start]=2017-02-27T13:25:30Z&filter[playerNames]=<playerName>" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```
```java
//Il existe une variété de bibliothèques Java HTTP qui prennent en charge les paramètres d'URL
```
```python
import requests

url = "https://api.dc01.gamelockerapp.com/shards/na/matches"

header = {
    "Authorization": "<api-key>",
    "X-TITLE-ID": "semc-vainglory",
    "Accept": "application/vnd.api+json"
}

query = {
    "sort": "createdAt",
    "filter[playerNames]": "<playerName>",
    "filter[createdAt-start]": "2017-02-28T13:25:30Z",
    "page[limit]": "3"
}

r = requests.get(url, headers=header, params=query)
```
```ruby
```
```javascript
```
```go
q := req.URL.Query()
q.Add("sort", "createdAt")
q.Add("filter[playerNames]", "<playerName>")
q.Add("filter[createdAt-start]", "2017-02-27T13:25:30Z")
q.Add("page[limit]", "3")
req.URL.RawQuery = q.Encode()
res, _ := client.Do(req)
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "type": "match",
      "id": "02b90214-c64d-11e6-9f6b-062445d3d668",
      "attributes": {
        "createdAt": "2017-01-06T20:30:08Z",
        "duration": 1482195372,
        "gameMode": "casual",
        "patchVersion": "1.0.0",
        "region": "na",
        "stats": "acesEarned: 3, etc..."
      },
      "relationships": {
        "rosters": {
          "data": [{
            "type": "roster",
            "id": "ea77c2eb-d44e-11e6-8f77-0242ac130004"
          }, {
            "type": "roster",
            "id": "dc2c14b4-d50c-11e6-bf26-cec0c932ce01"
          }]
        }
      }
    }
  ]
}
```

Ce point de terminaison extrait les données des correspondances. Les combats en vrac sont interdits.

### Demande HTTP

`GET https://api.dc01.gamelockerapp.com/shards/na/matches`

### Paramètres De Requête

Paramètre | défaut | Description
--------- | ------- | -----------
Page [offset] | 0 | Permet la pagination sur les résultats
Page [limite] | 50 | Le défaut (et le maximum actuel) est de 50. Les valeurs inférieures à 50 et supérieures à 2 sont prises en charge.
sort | createdAt | Par défaut, les résultats sont triés par temps de création ascendant.
filtre[createdAt-start] | il y a 3 heures Il doit se produire avant l'heure de fin de session. Le format est iso8601 Utilisation: filtre[createdAt-start]=2017-01-01T08:25:30Z
filtre[createdAt-end] | Maintenant |, les requêtes recherchent les 3 dernières heures. Le format est iso8601, c'est-à-dire le filtre[createdAt-end]=2017-01-01T13:25:30Z
filter[playerNames] | none | Filtres par nom de joueur. Utilisation: filter[playerNames]=player1,player2,...
filtre[playerIds] | aucun | Filtres par joueur ID. Utilisation: filtre[playerIds]=playerId,playerId,...
filter[teamNames] | none | Filtres par noms d'équipe. Utilisation: filter[teamNames]=team1,team2,...
filter[gameMode] | aucun | filtre par gameMode Utilisation: filter[gameMode]=casual,classé,...


<aside class="success">
Rappelez-vous - un match heureux est un match authentifié!
</aside>

## Obtenez Un Seul Match


```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/matches/<matchID>" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```
```java
//Il existe une variété de bibliothèques Java HTTP qui prennent en charge les paramètres d'URL
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
{
  "data": {
    "type": "match",
    "id": "02b90214-c64d-11e6-9f6b-062445d3d668",
    "attributes": {
      "createdAt": "2017-01-06T20:30:08Z",
      "duration": 1482195372,
      "gameMode": "casual",
      "patchVersion": "1.0.0",
      "region": "na",
      "stats": "acesEarned: 3, etc..."
    },
    "relationships": {
      "rosters": {
        "data": [{
          "type": "roster",
          "id": "ea77c2eb-d44e-11e6-8f77-0242ac130004"
        }, {
          "type": "roster",
          "id": "dc2c14b4-d50c-11e6-bf26-cec0c932ce01"
        }]
      }
    }
  }
}
```

Ce point final récupère une correspondance spécifique.

### Requête HTTP

`GET https://api.dc01.gamelockerapp.com/shards/na/matches/<ID>`

### Paramètres d'URL

Paramètre | Description
--------- | -----------
ID | L'ID du match à récupérer