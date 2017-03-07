# Making Requests

## Content Negotiation

Clients using the api should specify that they accept responses using the
`application/vnd.api+json` format, for convenience we will also accept `application/json`
since it is the default for many popular client libraries.

The Server will respond with a `Content-Type` header that mirrors the format
requested by the Client.


## Regions

> To specify the regions, use this code:

```shell
"...gamelockerapp.com/shards/<region>/..."
```
```java
"...gamelockerapp.com/shards/<region>/..."
```
```python
"...gamelockerapp.com/shards/<region>/..."
```
```ruby
"...gamelockerapp.com/shards/<region>/..."
```
```javascript
"...gamelockerapp.com/shards/<region>/..."
```
```go
"...gamelockerapp.com/shards/<region>/..."
```

The Vainglory Game Data Service currently supports the following regions:

* North America: na
* Europe: eu
* South America: sa
* East Asia: ea
* Southeast Asia (SEA): sg

**Choosing a specific region is currently required**

## GZIP

> To specify the header Accept-Encoding, use this code:

```shell
-H "Accept-Encoding: gzip"
```
```java
conn.setRequestProperty("Accept-Encoding","gzip");

```
```python
header = {"Accept-Encoding":"gzip"}
```
```ruby
```
```javascript
```
```go
req.Header.Set("Accept-Encoding", "gzip")
```

Clients can specify the header `Accept-Encoding: gzip` and the server will compress responses.  
Responses will be returns with `Content-Encoding: gzip`.

Given the size of matches, this can have significant performance benefits.


## Pagination


Where applicable, the server allows requests to limit the number of results
returned via pagination. To paginate the primary data, supply pagination information
to the query portion of the request using the limit and offset parameters.  
To fetch items 2 through 10 you would specify a limit of 8 and an offset of 2:

If not specified, the server will default for matches to`limit=5` and `offset=0`, and for players/samples to `limit=50` and `offset=0`

<aside class="warning">
Important - Currently the server will not allow responses with over 50 primary data objects
</aside>

## Sorting

>The example below will return the oldest articles first:

```shell
".../matches?sort=createdAt"
```
```java
".../matches?sort=createdAt"
```
```python
".../matches?sort=createdAt"
```
```ruby
".../matches?sort=createdAt"
```
```javascript
".../matches?sort=createdAt"
```
```go
".../matches?sort=createdAt"
```

>The example below will return the newest articles first.

```shell
".../matches?sort=-createdAt"
```
```java
".../matches?sort=-createdAt"
```
```python
".../matches?sort=-createdAt"
```
```ruby
".../matches?sort=-createdAt"
```
```javascript
".../matches?sort=-createdAt"
```
```go
".../matches?sort=-createdAt"
```
The default sort order is always ascending. Ascending corresponds to the
standard order of numbers and letters, i.e. A to Z, 0 to 9).  For dates and times,
ascending means that earlier values precede later ones e.g. 1/1/2000 will sort
ahead of 1/1/2001.

All resource collections have a default sort order.  In addition, some resources
provide the ability to sort according to one or more criteria ("sort fields").

If sort fields are is prefixed with a minus, the order will be changed to descending.

## JSON-P Callbacks

```shell
curl -g "https://api.dc01.gamelockerapp.com/status?callback=foo"
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
