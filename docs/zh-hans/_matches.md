
# Matches

玩家每完成一场比赛后，就会生成比赛记录。每场比赛都包含了主要的可读信息，例如游戏时长，
游戏模式等。每场比赛都会产生两组数据（两个Roster） 


## Rosters

```json
{
  "type": "roster",
  "id": "eca49808-d510-11e6-bf26-cec0c932ce01",
  "attributes": {
    "stats": {
      "acesEarned": 2,
      "gold": 32344,
      "etc..."
    }
  },
  "relationships": {
    "team": {
      "data": {
        "type": "team",
        "id": "753d464c-d511-11e6-bf26-cec0c932ce01"
      }
    },
    "participants": {
      "data": [
        {
          "type": "participant",
          "id": "eca49a7e-d510-11e6-bf26-cec0c932ce01"
        },
        "etc..."
      ]
    }
  }
}
```

Roster将会追踪记录游戏中参与者（Participants）的得分。如果玩家们组团开始匹配游戏，Roster中就会相应的队伍出现。Rosters对象仅当于比赛关联时才有意义，而不是作为一个独立的资源。

## Participants

```json
{
  "type": "participant",
  "id": "ea77c3a7-d44e-11e6-8f77-0242ac130004",
  "attributes": {
    "actor": "*Hero009*",
    "stats": {
      "assists": 4,
      "crystalMineCaptures": 1,
      "deaths": 2,
      "farm": 49.25,
      "etc..."
    }
  }
}
```
Participant对象在Roster中追踪每个成员。Participant可以是匿名玩家，注册玩家，或是AI。Participant对象是注册玩家的时候，Participant会和一个player对象关联。Roster将会追踪记录游戏中参与者（Participants）的得分。如果玩家们组团开始匹配游戏，Roster中就会相应的队伍出现。Participant对象仅当于比赛关联时才有意义，而不是作为一个独立的资源。

## Get a collection of Matches
## 获取一组比赛 （Matches）

```shell
curl -g "https://api.dc01.gamelockerapp.com/shards/na/matches?sort=createdAt&page[limit]=3&filter[createdAt-start]=2017-02-27T13:25:30Z&filter[playerNames]=<playerName>" \
  -H "Authorization: Bearer <api-key>" \
  -H "Accept: application/vnd.api+json"
```
```java
//There are a variety of Java HTTP libraries that support query-parameters.
```
```python
import requests

url = "https://api.dc01.gamelockerapp.com/shards/na/matches"

header = {
    "Authorization": "<api-key>",
    "Accept": "application/vnd.api+json"
}

query = {
    "sort": "createdAt",
    "filter[playerNames]": "<playerName>",
    "filter[createdAt-start]": "2017-02-28T13:25:30Z",
    "page[limit]": "3"
}

r = requests.get(url, headers=header, params=query)
```
```ruby
```
```javascript
```
```go
q := req.URL.Query()
q.Add("sort", "createdAt")
q.Add("filter[playerNames]", "<playerName>")
q.Add("filter[createdAt-start]", "2017-02-27T13:25:30Z")
q.Add("page[limit]", "3")
req.URL.RawQuery = q.Encode()
res, _ := client.Do(req)
```
> 上面的命令返回的JSON结构如下：

```json
{
  "data": [
    {
      "type": "match",
      "id": "02b90214-c64d-11e6-9f6b-062445d3d668",
      "attributes": {
        "createdAt": "2017-01-06T20:30:08Z",
        "duration": 1482195372,
        "gameMode": "casual",
        "patchVersion": "1.0.0",
        "shardId": "na",
        "stats": "acesEarned: 3, etc..."
      },
      "relationships": {
        "rosters": {
          "data": [{
            "type": "roster",
            "id": "ea77c2eb-d44e-11e6-8f77-0242ac130004"
          }, {
            "type": "roster",
            "id": "dc2c14b4-d50c-11e6-bf26-cec0c932ce01"
          }]
        }
      }
    }
  ]
}
```

此接口从比赛中检索数据。禁止使用此接口大量获取比赛数据。
### HTTP Request

`GET https://api.dc01.gamelockerapp.com/shards/na/matches`

### Query Parameters

参数       | 默认    | 描述
--------- | ------- | -----------
page[offset] | 0 | 允许在结果上分页
page[limit] | 50 | 默认（也是现在最大值）是50。有效范围在2到50
sort | createdAt | 默认比赛是按照创建时间升序排。
filter[createdAt-start] | 3hrs ago |必须在结束时间前发生。格式为iso8601，用例: filter[createdAt-start]=2017-01-01T08:25:30Z
filter[createdAt-end] | Now | Queries search the last 3 hrs. Format is iso8601 i.e. filter[createdAt-end]=2017-01-01T13:25:30Z
filter[playerNames] | none | 以玩家名字筛选，用例: filter[playerNames]=player1,player2,...
filter[playerIds] | none | 以玩家Id筛选. 用例: filter[playerIds]=playerId,playerId,...
filter[teamNames] | none | 以团队名字筛选。团队名和游戏内团队标签一样，用例：  filter[teamNames]=TSM,team2,...
filter[gameMode] | none | 以游戏模式筛选，用例: filter[gameMode]=casual,ranked,...

<aside class="success">
Remember — a happy match is an authenticated match!
</aside>

## 获取单个匹配

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/matches/<matchID>" \
  -H "Authorization: Bearer <api-key>" \
  -H "Accept: application/vnd.api+json"
```
```java
//There are a variety of Java HTTP libraries that support URL parameters
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
    "type": "match",
    "id": "02b90214-c64d-11e6-9f6b-062445d3d668",
    "attributes": {
      "createdAt": "2017-01-06T20:30:08Z",
      "duration": 1482195372,
      "gameMode": "casual",
      "patchVersion": "1.0.0",
      "shardId": "na",
      "stats": "acesEarned: 3, etc..."
    },
    "relationships": {
      "rosters": {
        "data": [{
          "type": "roster",
          "id": "ea77c2eb-d44e-11e6-8f77-0242ac130004"
        }, {
          "type": "roster",
          "id": "dc2c14b4-d50c-11e6-bf26-cec0c932ce01"
        }]
      }
    }
  }
}
```

该接口用于检索具体比赛。

### HTTP Request

`GET https://api.dc01.gamelockerapp.com/shards/na/matches/<ID>`

### URL Parameters


参数      | 描述
--------- | -----------
ID | 用于检索的比赛ID

### HTTP Request

`GET https://api.dc01.gamelockerapp.com/shards/na/matches/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the match to retrieve

## 找不到比赛数据?

我们特意隐藏了一些比赛数据。具体来说，一场比赛必须满足以下所有要求，才能被认为是一场有效比赛.
  1.  游戏模式必须为一下一种:
    * 排位赛
    * 匹配赛
    * 好友对战
    * private_party_draft_match
    * private_party_aral_match
    * private_party_blitz_match
    * casual_aral
    * blitz_pvp_ranked
  1. 不能以以下状态结束:
    * 结束练习
    * 玩家数目不足
  1. 由于专业玩家练习需求，我们会去除无排位玩家切游戏模式为好友对战的比赛。
