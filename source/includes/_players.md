# Players (Coming Soon!)

Player objects contain aggregated lifetime information about each Player.

## Get a collection of Players

```shell
curl "https://api.dc01.gamelockerapp.com/players" \
  -H "Authorization: Bearer getoffmylawn" \
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

This endpoint retrieves all players.

<aside class="warning">
Important - Player resources are not yet available in the API.
</aside>

### HTTP Request

`GET https://api.dc01.gamelockerapp.com/players`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------

<aside class="success">
Remember — a happy player is an authenticated player!
</aside>

## Get a single Player

```shell
curl "https://api.dc01.gamelockerapp.com/players/2" \
  -H "Authorization: Bearer getoffmylawn" \
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

This endpoint retrieves a specific player.

### HTTP Request

`GET https://api.dc01.gamelockerapp.com/players/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the player to retrieve
