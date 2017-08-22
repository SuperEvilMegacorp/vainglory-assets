# 接收响应

## 数据载荷（Payload）

所有服务器响应信息均包含一个根JSON对象。

~~~.language-json
{
  "data": {
    "type": "match",
    "id": "skarn",
    "attributes": {
      // ... this matches attributes
    },
    "relationships": {
      // ... this matches relationships
    }
  }
}
~~~

~~~.language-json
{
  "data": {
    "type": "match",
    "id": "1"
  }
}
~~~

响应数据至少包含下列顶级成员：

  * `data`: 相应的主要数据
  * `errors`: 用于存放错误对象的数组

响应数据可能包含下列顶级成员：

  * `links`: 与主要数据相关的links对象。
  * `included`: 用于存放资源对象的数组，资源对象与主要数据相关，或互相相关（“included resources”）

如果文档（document）中没有顶层数据键，则包含的成员也不会出现。

主要数据的内容为下述两项二选一：

Primary data will be either:

  * 一个[resource object][resource objects]，一个[resource identifier object]，或 `null`
  * 一个[resource objects]数组, 一个[resource identifier objects][resource identifier object]数组, 或
  空数组 (`[]`)

例如，下述主要数据就是一个资源对象

下面列出的主要数据是一个引用了相同资源的 [resource identifier object]

逻辑上来讲资源的集合必然以数组的方式出现，即便数组中仅有一个条目或者是空的。

## Rate Limits

>请求频率限制头部定义如下：

~~~
X-RateLimit-Limit - 每天/每分钟请求数量的限制
X-RateLimit-Remaining - 时间窗口内剩余可用请求数量
X-RateLimit-Reset - 以UTC epoch纳秒为单位，比率限制的窗口时间剩余量。
* 限制数额以 60（秒）为速率增长。也就是说
~~~

如果您请求的过于频繁，我们会返回给您一个 `429` 错误代码（服务器不可用）。

<aside class="notice">
非商业用途免费，每分钟请求数量上限为10。如需增加频率限制，请联系api@superevilmegacorp.com。
</aside>
