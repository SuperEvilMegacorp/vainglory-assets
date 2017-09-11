# Links (即将到来!)

## 获取 Link

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/link/{id}" \
  -H "Authorization: Bearer <api-key>" \
  -H "Accept: application/vnd.api+json"
```

此接口检查指定的link对象是否存在。

### HTTP 请求

`GET https://api.dc01.gamelockerapp.com/link`

### Query 参数

Parameter | Default | Description
--------- | ------- | -----------

参数 | 默认 | 描述
--- | ---- | ----


## POST请求一个Link

```shell
curl -XPOST "https://api.dc01.gamelockerapp.com/shards/na/link/{player_id}" \
  -H "Authorization: Bearer <api-key>" \
  -H "Accept: application/vnd.api+json"
```

如果验证码与游戏中对应资源相匹配，则此接口将创建一个PlayerLink对象。


### HTTP Request

`POST https://api.dc01.gamelockerapp.com/link/{player_id}`

### Query 参数

Parameter | Default | Description
--------- | ------- | -----------
code      |         | The verification code

参数 | 默认 | 描述
--- | ---- | ----
代码 | ---- |验证代码  
## PlayerLink

```json
{
  "attributes": {
      "playerId": "fb374a7b-78be-4fcc-83ed-6a532a8a6f55",
      "shardId": "na",
      "titleId": "semc-vainglory"
  },
  "id": "2454e5ac-0a69-4468-ad12-8616f066e817",
  "type": "playerLink"
}
```
