# Players

Player objects contain aggregated lifetime information about each Player.  At this time Players are fairly sparse, but there are plans to add much richer data as it becomes available.

## Get a single Player

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/players/<ID>" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
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
{
"data": {
  "attributes": {
      "stats": {
          "lossStreak": 1,
          "winStreak": 0,
          "lifetimeGold": 10536.0
      },
      "name": "boombastic04"
  },
  "type": "player",
  "id": "6abb30de-7cb8-11e4-8bd3-06eb725f8a76"
}
}
```

This endpoint retrieves a specific player.

<aside class="notice">
Changes Coming! - Player resources are not fully defined at this point, but are
included so that consumers can get basic info (name, etc.)  This object will have
additional data added over the next few months, and may change slightly as data
moves from the `attributes.stats` object to the main `attributes` object.
</aside>

### HTTP Request

`GET https://api.dc01.gamelockerapp.com/shards/na/players/<ID>`


### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the player to retrieve


## Get a collection of players

This endpoint retrieves a collection of up to 6 players, filtered by name. Player names are specific to each region. If a player has changed names, it is possible that there are multiple ID's for a single player name.

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/players?filter[playerNames]=player1,player2" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
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

### HTTP Request

`GET https://api.dc01.gamelockerapp.com/shards/na/players`

### Query Parameters


Parameter | Default | Description
--------- | ------- | -----------
filter[playerNames] | none | Filters by player names. Usage: filter[playerNames]=player1,player2
