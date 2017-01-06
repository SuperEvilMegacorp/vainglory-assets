
# Matches

## Get a collection of Matches

```shell
curl "https://api.gamelockerapp.com/matches"
  -H "X-API-KEY: getoffmylawn"
  -H "X-TITLE-ID: vainglory"
  -H "Accept: application/vnd.api+json"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all matches.

### HTTP Request

`GET https://api.gamelockerapp.com/matches`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include matches that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Match

```shell
curl "https://api.gamelockerapp.com/matches/991839021349012374"
  -H "X-API-KEY: getoffmylawn"
  -H "X-TITLE-ID: vainglory"
  -H "Accept: application/vnd.api+json"
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

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET https://api.gamelockerapp.com/matches/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve
