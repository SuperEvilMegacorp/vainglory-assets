### Pagination

Where applicable, the server allows requests to limit the number of results
returned via pagination. To paginate the primary data, supply pagination information
to the query portion of the request using the limit and offset parameters.  
To fetch items 11 through 30 you would specify a limit of 10 and an offset of 10:

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/matches?limit=20&offset=10" \
  -H "Authorization: Bearer aaa.bbb.ccc" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```
```python
api.matches(limit=20, offset=10)
# limits above the maximum will be split into multiple requests automatically
```

If not specified, the server will default `limit=50` and `offset=0`.

<aside class="warning">
Important - Currently the server will not allow responses with over 50 primary data objects
</aside>
