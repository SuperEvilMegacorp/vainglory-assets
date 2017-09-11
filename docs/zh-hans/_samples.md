# 示例

示例接口中提供了以小时为周期批量获取随机匹配数据以统计的简单方法。

## 获取多个样例数据

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/samples" \
  -H "Authorization: Bearer <api-key>" \
  -H "Accept: application/vnd.api+json"
```
```java
//有很多Java HTTP库支持参数请求
```
```python
```
```ruby
```
```javascript
```
```go
```

> 上方请求返回的JSON数据样例如下：

```json
{
      "type": "sample",
      "id": "sample-na-2017-02-28T07:15:30Z",
      "attributes": {
        "URL": "URL of Sample Matches",
        "createdAt": "2017-02-28T07:15:30Z",
        "shardId": "na",
        "t0": "2017-02-28T07:15:30Z",
        "t1": "2017-02-28T08:15:30Z",
        "titleId": "semc-vainglory"
      },
      "relationships": {
        "assets": {
          "data": []
        }
      }
    }
```
该接口可以用户获取多个随机选取的匹配信息

### HTTP 请求

`GET https://api.dc01.gamelockerapp.com/shards/na/samples`

### 请求参数

参数 | 默认 | 描述
----|------|----
page[offset] | 0 | 允许结果翻页
page[limit] | 50 | 默认为50（当前为最大值）。支持大于2小于50的值
sort | createdAt | 默认情况下，采样数据是按照创建时间升序排序的
filter[createdAt-Start] | none | 必须置于时间之前，格式遵循ISO8601，用法：filter[createdAt-end]=2017-01-01T08:25:30Z
filter[createdAt-End] | none | 必须置于时间之后，格式遵循ISO8601，用法：filter[createdAt-end]=2017-01-01T13:25:30Z
