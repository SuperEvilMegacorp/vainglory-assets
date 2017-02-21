# Players

Player objects contain aggregated lifetime information about each Player.  At this
time Players are fairly sparse, but there are plans to add much richer data
as it becomes available.

## Get a single Player

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/players/6abb30de-7cb8-11e4-8bd3-06eb725f8a76" \
  -H "Authorization: Bearer aaa.bbb.ccc" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```


```python
>>> p = api.player("6abb30de-7cb8-11e4-8bd3-06eb725f8a76")
>>> p
<gamelocker.datatypes.Player object at 0x7fe4814ede48>
>>> p.stats["lifetimeGold"]
10536.0
>>> p.name
'boombastic04'
```


```go
>>> player, _, _ := client.GetPlayerByID(playerID)
>>> player.name
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

<aside class="warning">
Changes Coming! - Player resources are not fully defined at this point, but are
included so that consumers can get basic info (name, etc.)  This object will have
additional data added over the next few months, and may change slightly as data
moves from the `attributes.stats` object to the main `attributes` object.
</aside>

### HTTP Request

***The second endpoint is used for query by player name! We currently only support single player name lookup.***

`GET https://api.dc01.gamelockerapp.com/shards/na/players/<ID>`

`GET https://api.dc01.gamelockerapp.com/shards/na/players`


### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the player to retrieve

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
filter[playerNames] | none | Filters by a single player name. Usage: filter[playerNames]=player1
