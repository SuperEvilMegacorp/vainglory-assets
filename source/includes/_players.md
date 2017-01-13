# Players

Player objects contain aggregated lifetime information about each Player.  At this
time Players are fairly sparse, but there are plans to add much richer data
as it becomes available.

## Get a single Player

```shell
curl "https://api.dc01.gamelockerapp.com/players/6abb30de-7cb8-11e4-8bd3-06eb725f8a76" \
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

`GET https://api.dc01.gamelockerapp.com/players/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the player to retrieve
