# Making Requests

## Content Negotiation

Clients using the api should specify that they accept responses using the
`application/vnd.api+json` format, for convenience we will also accept `application/json`
since it is the default for many popular client libraries.

The Server will respond with a `Content-Type` header that mirrors the format
requested by the Client.

## GZIP

Clients can specify the header `Accept-Encoding: gzip` and the server will compress responses.  
Responses will be returns with `Content-Encoding: gzip`.

Given the size of matches, this can have significant performance benefits.

```go
//Already implemented in NewClient
```


## Pagination

```shell
curl -g "https://api.dc01.gamelockerapp.com/shards/na/matches?page[limit]=3&page[offset]=0" \
  -H "Authorization: api-key" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

```python
api.matches({"page[limit]": 20, "page[offset]": 10})
```

```go
//The QueryRequest has usable queries attached
>>> q := new(v.QueryRequest)
>>> q.Limit = "3"
>>> q.Offset = "0"
>>> client := v.NewClient(apikey, q)
```

```javascript
/* defaults */
const options = {
  page: {
    offset: 0,
    limit: 50,
  },
  sort: 'createdAt',
  filters: {
    started: '3hrs ago',
    ended: 'Now',
    playerNames: [],
    teamNames: [],
  }
}
```
```java

public List<Match> getSortedMatchesForPlayer(String playerName, Shard shard) {
        return flickerApi.getMatches(new MatchRequest.Builder().playerName(playerName).shard(shard).sortField("-creationDate").build());
    }
```

Where applicable, the server allows requests to limit the number of results
returned via pagination. To paginate the primary data, supply pagination information
to the query portion of the request using the limit and offset parameters.  
To fetch items 2 through 10 you would specify a limit of 8 and an offset of 2:


If not specified, the server will default `limit=50` and `offset=0`.

<aside class="warning">
Important - Currently the server will not allow responses with over 50 primary data objects
</aside>

## Sorting

```shell
curl -g "https://api.dc01.gamelockerapp.com/shards/na/matches?sort=createdAt" \
  -H "Authorization: api-key" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```
```python
api.matches({"page[limit]": 20, "page[offset]": 10, "sort": "createdAt"})
```

```go
>>> q := new(v.QueryRequest)
>>> q.SortField = "createdAt"
```

All resource collections have a default sort order.  In addition, some resources
provide the ability to sort according to one or more criteria ("sort fields").

```shell
curl -g "https://api.dc01.gamelockerapp.com/shards/na/matches?sort=-createdAt" \
  -H "Authorization: api-key" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```
```python
api.matches({"page{limit}": 20, "page[offset]": 10, "sort": "-createdAt"})
```

```go
>>> q := new(v.QueryRequest)
>>> q.SortField = "-createdAt"
```

The above example should return the oldest articles first, meaning that
the default sort order is always ascending. Ascending corresponds to the
standard order of numbers and letters, i.e. A to Z, 0 to 9).  For dates and times,
ascending means that earlier values precede later ones e.g. 1/1/2000 will sort
ahead of 1/1/2001.

If sort fields are is prefixed with a minus, the order will be changed to descending.

The above example should return the newest articles first.

## JSON-P Callbacks

```shell
curl -g https://api.dc01.gamelockerapp.com/status?callback=foo
```

You can send a ?callback parameter to any GET call to have the results wrapped in a JSON function. This is typically used when browsers want to embed content in web pages by getting around cross domain issues. The response includes the same data output as the regular API, plus the relevant HTTP Header information.


## Cross Origin Resource Sharing

```shell
curl -i https://api.dc01.gamelockerapp.com/status -H "Origin: http://example.com"
  HTTP/1.1 200 OK
  ...
  Access-Control-Allow-Origin: *
  Access-Control-Expose-Headers: Content-Length
```
This is what the CORS preflight request looks like:

```shell
curl -i https://api.dc01.gamelockerapp.com/status -H "Origin: http://example.com" -X OPTIONS
  HTTP/1.1 200 OK
  ...
  Access-Control-Allow-Headers: Origin,X-Title-Id,Authorization
  Access-Control-Allow-Methods: GET,POST,OPTIONS
  Access-Control-Allow-Origin: *
  Access-Control-Max-Age: 86400
```

The API supports Cross Origin Resource Sharing (CORS) for AJAX requests from any origin.
You can read the CORS W3C Recommendation, or this intro from the HTML 5 Security Guide.

Here's a sample request sent from a browser hitting http://example.com:
