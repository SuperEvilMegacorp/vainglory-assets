# 发送请求

## 内容协商

使用API的客户端应指定其可接受的响应类型，格式为`application/vnd.api+json`，为方便起见
`application/json`也是可以的，因为后者在很多常见客户端类库中是默认支持的。

服务器在响应时会附带相同`Content-Type`头部。

## 地区

> 要指定地区，使用下列代码：

```shell
"...gamelockerapp.com/shards/<region>/..."
```
```java
"...gamelockerapp.com/shards/<region>/..."
```
```python
"...gamelockerapp.com/shards/<region>/..."
```
```ruby
"...gamelockerapp.com/shards/<region>/..."
```
```javascript
"...gamelockerapp.com/shards/<region>/..."
```
```go
"...gamelockerapp.com/shards/<region>/..."
```

Vainglory游戏数据服务器目前支持下列地区


***General Region Shards***

要在具体指定的公开服务器上查找数据，请使用以下分片。

* **China:** ```cn```
* **North America:** ```na```
* **Europe:** ```eu```
* **South America:** ```sa```
* **East Asia:** ```ea```
* **Southeast Asia (SEA):** ```sg```

***Tournament Region Shards***

要寻找专业电子竞技的数据（仅在特殊设备中产生），请使用以下分片。

* **North America Tournaments:** ```tournament-na```
* **Europe Tournaments:** ```tournament-eu```
* **South America Tournaments:** ```tournament-sa```
* **East Asia Tournaments:** ```tournament-ea```
* **Southeast Asia Tournaments:** ```tournament-sg```

***公测环境***

针对于与SEMC签订合同以获取公测环境（PBE）权限的开发者，其密钥有以下额外的数据访问。

* **公测（即将到来）：pbe

**当前需要选择一个具体区域**
## GZIP

> 要为头部指定可接受的编码

```shell
-H "Accept-Encoding: gzip"
```
```java
conn.setRequestProperty("Accept-Encoding","gzip");

```
```python
header = {"Accept-Encoding":"gzip"}
```
```ruby
```
```javascript
```
```go
req.Header.Set("Accept-Encoding", "gzip")
```

客户端可以使用指定 `Accept-Encoding: gizp` 头部，服务器在响应时会对响应做压缩处理。
从服务器返回的类型将会是 `Content-Encoding: gzip`。

考虑到匹配数据的大小，这样可以获得极大的性能上的提升。

## 分页

## Pagination

服务器可以在需要的时候允许通过分页（pagination）限制结果的数量。要为主要数据（primary data）分页，只需使用limit和offset参数，在请求的查询部分提供分页信息即可。
要获取条目2到条目10，您需要指定限制数量（limit）为8，偏移量（offset）为2：

如果未指定这些参数，服务器默认为匹配取值 `limit = 5`，`offset = 0`，为玩家/样本取值 `limit = 50`， `offset = 0`

<aside class="warning">
重要 - 目前服务器不允许响应超过50条主要数据对象的请求。
</aside>

## Time

* createdAt-start 与 createdAt-end 之间的最大时间区间是 28 天。
* 如果您没有指定 createdAt-start 或 createdAt-end 则默认的时间区间是 当前时间 - 28天。
* 如果您只指定了 createdAt-start，则 createdAt-end 为28天后或当前时间（以先到时间为准）。
* 如果您只指定了 createdAt-end，则createdAt-start 为28天之前。
* 如果您指定了未来的某个时间，且在28天限制之内，则createdAt-end 默认为当前时间。

## Sorting

>下例会返回时间最早的文章

```shell
".../matches?sort=createdAt"
```
```java
".../matches?sort=createdAt"
```
```python
".../matches?sort=createdAt"
```
```ruby
".../matches?sort=createdAt"
```
```javascript
".../matches?sort=createdAt"
```
```go
".../matches?sort=createdAt"
```

>下例会返回最新的文章

```shell
".../matches?sort=-createdAt"
```
```java
".../matches?sort=-createdAt"
```
```python
".../matches?sort=-createdAt"
```
```ruby
".../matches?sort=-createdAt"
```
```javascript
".../matches?sort=-createdAt"
```
```go
".../matches?sort=-createdAt"
```

默认的排序顺序为升序，升序的意思就是数字和字母的标准顺序，例如 从A到Z，从0到9。
对于日期与时间来说，升序是从较早的时间到较晚的时间，例如升序排序的日期中2000年1月1日在2001年1月1日之前。

所有的资源集合都有其默认的排序顺序。此外，某些资源还为排序操作提供了一个或更多个条件（"排序字段"）

如果排序字段前方有减号，则顺序会更改为降序。

## JSON-P 回调

```shell
curl -g "https://api.dc01.gamelockerapp.com/status?callback=foo"
```

您可以在任意GET调用参数中添加?callback参数，这样一来响应的结果就会被封装到JSON函数中。通常浏览器使用这种方法来向网页中嵌入额外的内容从而绕过域名问题。其响应中包含的数据与一般的API相同，额外加上相关的HTTP头部数据。


## 跨域资源共享

```shell
curl -i https://api.dc01.gamelockerapp.com/status -H "Origin: http://example.com"
  HTTP/1.1 200 OK
  ...
  Access-Control-Allow-Origin: *
  Access-Control-Expose-Headers: Content-Length
```

下面是CROS数据发送之前的样子：

```shell
curl -i https://api.dc01.gamelockerapp.com/status -H "Origin: http://example.com" -X OPTIONS
  HTTP/1.1 200 OK
  ...
  Access-Control-Allow-Headers: Origin,X-Title-Id,Authorization
  Access-Control-Allow-Methods: GET,POST,OPTIONS
  Access-Control-Allow-Origin: *
  Access-Control-Max-Age: 86400
```

API支持任意源的CORS的AJAX请求。您可以参阅CROS W3C建议，或HTML 5 安全指引中的教程。

下面是当浏览器访问 http://example.com 时的请求样例：
