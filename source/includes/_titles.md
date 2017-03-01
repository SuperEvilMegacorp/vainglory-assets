# Titles

> To specify the title, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "https://api.dc01.gamelockerapp.com" \
  -H "X-TITLE-ID: semc-vainglory"
```

```python
```

```go
```

```javascript
```

All endpoints require the following `X-TITLE-ID` header in order for us to respond to a request.

`X-TITLE-ID: semc-vainglory`

<aside class="notice">
No no, this isn't a hint at more Super Evil game titles.  The Vainglory Game Data
Service uses a platform called Gamelocker which system itself can store multiple titles.
</aside>
