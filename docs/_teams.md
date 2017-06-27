# Teams (Coming Soon!)

Team objects contain aggregated lifetime information about each Team.

## Get a collection of Teams

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/teams?filter[teamNames]=team1" \
  -H "Authorization: Bearer <api-key>" \
  -H "Accept: application/vnd.api+json"
```

This endpoint retrieves a collection of up to 6 teams.

<aside class="warning">
Important - Team resources are not yet available in the API.
</aside>

### HTTP Request

`GET https://api.dc01.gamelockerapp.com/teams`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
filter[teamNames] | none | Filters by team name. Usage: filter[teamNames]=team1
filter[teamIds] | none | Filter by team id. Usage: filter[teamIds]=12345

<aside class="success">
Remember — a happy team is an authenticated team!
</aside>

## Get a single Team

```shell
curl "https://api.dc01.gamelockerapp.com/teams/<ID>" \
  -H "Authorization: Bearer <api-key>" \
  -H "Accept: application/vnd.api+json"
```

```python
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
