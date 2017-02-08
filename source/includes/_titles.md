# Titles

> To specify the title, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "https://api.dc01.gamelockerapp.com" \
  -H "X-TITLE-ID: semc-vainglory"
```

```ruby
# Unfortunately, there is no example yet.  Feel free to submit one!
```

```python
api = gamelocker.Gamelocker.Vainglory()
```

```javascript
// Unfortunately, there is no example yet.  Feel free to submit one!
```

```go
// Create a client and pass in the api key and any query requests
>>> client := v.NewClient(apikey, query)
```

All endpoints require the following `X-TITLE-ID` header in order for us to respond to a request.

`X-TITLE-ID: semc-vainglory`

<aside class="notice">
No no, this isn't a hint at more Super Evil game titles.  The Vainglory Game Data
Service uses a platform called Gamelocker which system itself can store multiple titles.
</aside>
