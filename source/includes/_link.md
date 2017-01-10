# Links (Coming Soon!)

## Get a Link

```shell
curl "https://api.dc01.gamelockerapp.com/link/{id}"
  -H "X-API-KEY: getoffmylawn"
  -H "X-TITLE-ID: vainglory"
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

<!-- > The above command returns JSON structured like this:

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
``` -->

This endpoint checks to see if a link object exists for a given code.

### HTTP Request

`GET https://api.dc01.gamelockerapp.com/link`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
