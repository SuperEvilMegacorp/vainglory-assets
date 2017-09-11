# 队伍 （即将到来！）

Team（队伍）对象中包含有每个队伍相关的聚合信息。

## 获取多个队伍信息

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/teams?filter[teamNames]=team1" \
  -H "Authorization: Bearer <api-key>" \
  -H "Accept: application/vnd.api+json"
```

该接口可以获取最多6个队伍的信息。

<aside class="warning">
重要 - 队伍信息目前还无法使用API获得。
</aside>

### HTTP 请求

`GET https://api.dc01.gamelockerapp.com/teams`

### 请求参数

参数      |   默认   |   描述
--------- | ------- | -----------
filter[teamNames] | 空 | 使用队伍名称过滤。 用法： filter[teamNames]=team1
filter[teamIds] | 空 | 使用队伍ID过滤。 用法： filter[teamIds]=12345

<aside class="success">
记住 —— 经过验证队伍总是玩得最爽的！
</aside>

## 获取单个队伍

```shell
curl "https://api.dc01.gamelockerapp.com/teams/<ID>" \
  -H "Authorization: Bearer <api-key>" \
  -H "Accept: application/vnd.api+json"
```

```python
```

> 上面的命令返回的JSON结构外观如下：

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

该端点可以获取某个队伍的信息。

### HTTP 请求

`GET https://api.dc01.gamelockerapp.com/teams/<ID>`

### URL 参数

参数 | 描述
--------- | -----------
ID | 要获取的队伍ID
