# JSON-P Callbacks

You can send a ?callback parameter to any GET call to have the results wrapped in a JSON function. This is typically used when browsers want to embed content in web pages by getting around cross domain issues. The response includes the same data output as the regular API, plus the relevant HTTP Header information.

```shell
curl https://api.dc01.gamelockerapp.com/status?callback=foo
```

```javascript
foo({
  "meta": {  
    "content-length":34,
    "content-type":"application/json; charset=utf-8",
    "status":200
  },
  "data": {
    ...  // the data
  }
})
```
