# Players

Player对象包含每个玩家的累计信息。 当前Players相对数据稀少，但已计划可用时会添加更加丰富的数据。

## 获取一个Player

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/players/<ID>" \
  -H "Authorization: Bearer <api-key>" \
  -H "Accept: application/vnd.api+json"
```

```java
//There are a variety of Java HTTP libraries that support query-parameters.
```

```python
```

```ruby
```

```javascript
```

```go
```

> 上面的命令返回的JSON结构如下：

```json
{
"data": {
  "attributes": {
      "stats": {
          "lossStreak": 1,
          "winStreak": 0,
          "lifetimeGold": 10536.0
      },
      "name": "boombastic04"
  },
  "type": "player",
  "id": "6abb30de-7cb8-11e4-8bd3-06eb725f8a76"
}
}
```
此接口检索一个具体的player.

* 如果玩家改过名字，则有可能一个玩家名字对应多个ID.

* 玩家改名并不对对此接口产生影响。玩家改名后，需要至少1场比赛的累积才能看到名字的改变

<aside class="notice">
变化来了! - 目前，Player资源并没有完全被定义，但还是被包含了，用户可以获得一些基础信息（名字，等。）在接下来的几个月，将会有更多的数据被加入到这个对象里，同时也可能会有一些小变动，比如数据从`attributes.stats`对象移到`attributes`对象。
</aside>

### HTTP 请求

`GET https://api.dc01.gamelockerapp.com/shards/na/players/<ID>`

### URL 参数

参数 | 描述
--------- | -----------
ID | 要检索的玩家的ID

## 获得多个玩家的信息

该端点可以获取最多6个玩家，以玩家的名字作为过滤条件。玩家的名字在各个地区是独立的。如果玩家更改过名字，则一个玩家可能有多个ID与之关联。

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/players?filter[playerNames]=player1,player2" \
  -H "Authorization: Bearer <api-key>" \
  -H "Accept: application/vnd.api+json"
```

```java
//有很多Java HTTP 库都支持参数请求
```

```python
```

```ruby
```

```javascript
```

```go
```

### HTTP 请求

`GET https://api.dc01.gamelockerapp.com/shards/na/players`

### 请求参数

参数 | 默认值 | 描述
--------- | ------- | -----------
filter[playerNames] | 空 | 以玩家的名称过滤 用法： filter[playerNames]=player1,player2
