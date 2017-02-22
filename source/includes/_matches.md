
# Matches

Matches records are created every time players complete a game session. Each Match
contains high level information about the game session, including info like
duration, gameMode, and more.  Each Match has two Rosters.   


## Rosters

```python
>>> match = api.match("eca49808-d510-11e6-bf26-cec0c932ce01")
>>> match.rosters[0].stats["gold"]
32344
```

```go
>>> match,_,_ := client.GetMatchByID(matchID)
>>> match.Rosters[0].Stats["gold"]
49951
```

```json
{
  "type": "roster",
  "id": "eca49808-d510-11e6-bf26-cec0c932ce01",
  "attributes": {
    "stats": {
      "acesEarned": 2,
      "gold": 32344,
      ...
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
        ...
      ]
    }
  }
}
```

Rosters track the scores of each opposing group of Participants. If players entered
matchmaking as a team, the Roster will have a related Team.  Rosters have many Participants
objects, one for each member of the Roster. Roster objects are only meaningful
within the context of a Match and are not exposed as a standalone resource.

## Participants
```python
>>> match = api.match("eca49808-d510-11e6-bf26-cec0c932ce01")
>>> participant_left_1 = match.rosters[0].participants[0]
>>> participant_left_1.stats.farm
49.25
>>> participant_left_1.actor.pretty()
'Skye'
```

```go
>>> match, _, _ := client.GetMatchByID(matchID)
>>> participantLeft1 := match.Rosters[0].Participants[0]
>>> participantLeft1.Actor
Kestrel
```

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
      ...
    }
  }
}
```
Participant objects track each member in a Roster.  Participants may be
anonymous Players, registered Players, or bots. In the case where the Participant
is a registered Player, the Participant will have a single Player relationship.
Participant objects are only meaningful within the context of a Match and are
not exposed as a standalone resource.

## Get a collection of Matches

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/matches" \
  -H "Authorization: Bearer aaa.bbb.ccc" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

```python
>>> m = api.matches()
[<gamelocker.datatypes.Match object at 0x7fe47abc7668>, <gamelocker.datatypes.Match object at 0x7fe47b6f80b8>, ...]
>>> m[0].createdAt
'2017-01-11T02:38:35Z'
>>> m[0].rosters[0]
<gamelocker.datatypes.Roster object at 0x7fe47abb0a90>
```

> The above command returns JSON structured like this:

```go
>>> matches,_,_ := client.GetMatches()
>>> matches[0].CreatedAt
```

```javascript
/* defaults */
const options = {
  page: {
    offset: 0,
    limit: 50,
  },
  sort: 'createdAt',
  filters: {
    started: '3hrs ago',
    ended: 'Now',
    playerNames: [],
    teamNames: [],
  }
}
vainglory.matches.collection(options).then((matches) => {
    // matches is the raw data represntation from the query.
}).catch((errorMsg) => {
  console.error(errorMsg);
});
```

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
        "stats": ...
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

This endpoint retrieves all matches.

### HTTP Request

`GET https://api.dc01.gamelockerapp.com/shards/na/matches`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page[offset] | 0 | Allows paging over results
page[limit] | 50 | The default (and current maximum) is 50.  Values less than 50 and great than 2 are supported.
sort | createdAt | By default, Matches are sorted by creation time ascending.
filter[createdAt-start] | 3hrs ago | Must occur before end time.  Format is iso8601  Usage: filter[createdAt-end]=2017-01-01T08:25:30Z
filter[createdAt-end] | Now | Queries search the last 3 hrs. Format is iso8601 i.e. filter[createdAt-end]=2017-01-01T13:25:30Z
filter[playerNames] | none | Filters by player name. Usage: filter[playerNames]=player1,player2,...
filter[teamNames] | none | Filters by team names. Usage: filter[teamNames]=team1,team2,...

<aside class="success">
Remember — a happy match is an authenticated match!
</aside>

## Get a single Match

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/matches/0123b560-d74c-11e6-b845-0671096b3e30" \
  -H "Authorization: Bearer aaa.bbb.ccc" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```


```python
api.match("0123b560-d74c-11e6-b845-0671096b3e30")
```


```go
>>> match,_,_ := client.GetMatchByID(matchID)
>>> match.GameMode
Casual
```
> The above command returns JSON structured like this:

```javascript
const matchId = '0123b560-d74c-11e6-b845-0671096b3e30';

vainglory.matches.single(matchId).then((match) => {
  console.log(match.id);
  console.log(match.stats);
}).catch((errorMsg) => {
  console.error(errorMsg);
});
```

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
      "stats": ...
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

This endpoint retrieves a specific match.

### HTTP Request

`GET https://api.dc01.gamelockerapp.com/shards/na/matches/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the match to retrieve
