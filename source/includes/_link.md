# Links (Coming Soon!)

## Get a Link

```shell
curl "https://api.dc01.gamelockerapp.com/kittens"
  -H "X-API-KEY: getoffmylawn"
  -H "X-TITLE-ID: vainglory"
  -H "Accept: application/vnd.api+json"
```

```ruby
# Unfortunately, there is no example yet.  Feel free to submit one!
```

```python
curl "https://api.dc01.gamelockerapp.com/kittens"
  -H "X-API-KEY: getoffmylawn"
  -H "X-TITLE-ID: vainglory"
  -H "Accept: application/vnd.api+json"
```

```javascript
curl "https://api.dc01.gamelockerapp.com/kittens"
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

This endpoint retrieves all kittens.

### HTTP Request

`GET https://api.dc01.gamelockerapp.com/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>
