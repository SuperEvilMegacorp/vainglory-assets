# Teams (Coming Soon!)

Team objects contain aggregated lifetime information about each Team.

## Get a collection of Teams

```shell
curl "https://api.dc01.gamelockerapp.com/teams" \
  -H "X-API-KEY: getoffmylawn" \
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

This endpoint retrieves all teams.

<aside class="warning">
Important - Team resources are not yet available in the API.
</aside>

### HTTP Request

`GET https://api.dc01.gamelockerapp.com/teams`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------

<aside class="success">
Remember — a happy team is an authenticated team!
</aside>

## Get a single Team

```shell
curl "https://api.dc01.gamelockerapp.com/teams/2" \
  -H "X-API-KEY: getoffmylawn" \
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
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific team.

### HTTP Request

`GET https://api.dc01.gamelockerapp.com/teams/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the team to retrieve
