# JSON-P Callbacks



你可以发送一个?callback参数给任意GET调用以将结果封装到一个JSON函数。这种一种常见用法来规避浏览器想把内容嵌入到网页时的跨域问题。该响应包括与常规api相同的数据输出，以及相关的http header信息。

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
