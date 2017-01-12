
# Matches

Matches records are created every time players complete a game session. Each Match
contains high level information about the game session, including info like
duration, gameMode, and more.  Each Match has two Rosters.   

## Rosters

Rosters track the scores of each opposing group of Participants. If players entered
matchmaking as a team, the Roster will have a related Team.  Rosters have many Participants
objects, one for each member of the Roster. Roster objects are only meaningful
within the context of a Match and are not exposed as a standalone resource.

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

## Participants
Participant objects track each member in a Roster.  Participants may be
anonymous Players, registered Players, or bots. In the case where the Participant
is a registered Player, the Participant will have a single Player relationship.
Participant objects are only meaningful within the context of a Match and are
not exposed as a standalone resource.

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

## Get a collection of Matches

```shell
curl "https://api.dc01.gamelockerapp.com/matches" \
  -H "Authorization: Bearer aaa.bbb.ccc" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```
```ruby
# Unfortunately, there is no example yet.  Feel free to submit one!
```

```python
# Unfortunately, there is no example yet.  Feel free to submit one!
```

```javascript
// Unfortunately, there is no example yet.  Feel free to submit one!
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

`GET https://api.dc01.gamelockerapp.com/matches`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page[offset] | 0 | Allows paging over results
page[limit] | 50 | The default (and current maximum) is 50.  Values less than 50 and great than 2 are supported.
filter[region] | * | Filters results by region.  By default, queries return all regions within the Datacenter.
sort | createdAt | By default, Matches are sorted by creation time ascending.

<aside class="success">
Remember — a happy match is an authenticated match!
</aside>

## Get a single Match

```shell
curl "https://api.dc01.gamelockerapp.com/matches/0123b560-d74c-11e6-b845-0671096b3e30" \
  -H "Authorization: Bearer aaa.bbb.ccc" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

```ruby
# Unfortunately, there is no example yet.  Feel free to submit one!
```

```python
# Unfortunately, there is no example yet.  Feel free to submit one!
```

```javascript
// Unfortunately, there is no example yet.  Feel free to submit one!
```

> The above command returns JSON structured like this:

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

`GET https://api.dc01.gamelockerapp.com/matches/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the match to retrieve
