

# <a href="#document-resource-objects" id="document-resource-objects" class="headerlink"></a> 资源对象

"资源对象" 出现在JSON API文档内，表示对应资源。 

资源对象**必须**至少包含以下的顶级成员： 

* `id`
* `type`

特殊情况：当资源对象在客户端产生，且表示要在服务器上创建的新资源时，`id` 成员并不是必须的。

此外，资源对象 **可能** 包含以下任意顶级成员：

* `attributes`: [attributes object][attributes] 表示资源数据。
* `relationships`: [relationships object][relationships] 描述了资源与其他JSON API资源之间的关系。
* `links`: [links object][links] 表示资源相关的链接

下面的示例展示了用于表示一篇文章（即 一种“文章“类型的资源）的文档数据。

```json
// ...
{
  "type": "articles",
  "id": "1",
  "attributes": {
    "title": "Rails is Omakase"
  },
  "relationships": {
    "author": {
      "links": {
        "self": "/articles/1/relationships/author",
        "related": "/articles/1/author"
      },
      "data": { "type": "people", "id": "9" }
    }
  }
}
// ...
```

#### <a href="#document-resource-object-identification" id="document-resource-object-identification" class="headerlink"></a> Identification

所有 [resource object][resource objects] **必须** 包含一个 `id` 成员和一个 `type` 成员。
`id` 和 `type` 成员的值 **必须** 是字符串。

给定一个API，每个资源对象的 `type` 和 `id` 数据对 **一定** 表示一个独立的唯一的资源。
（一个API由一组URI构成，而后者是由一个服务器或作为一个整体的多个服务器控制的）

`type` 成员用于描述使用了相同属性（attribute）和关系（relationship）的[resource objects]。

`type` 成员的值 **必须** 满足与 [member names] 类似的限制。

> 提示：本说明文档中不会考虑词形变化，因此 `type` 值可能是单数也可能是复数。但不管怎么样，在功能实现过程中应始终使用相同的值。

#### <a href="#document-resource-object-fields" id="document-resource-object-fields" class="headerlink"></a> Fields

资源对象的 [attributes] 与 [relationships] 都叫做该对象的 "[fields]"

对于一个[resource object][resource objects]中的字段（Fields），它们 **必须** 处于相同的命名空间下。
换句话说，资源中的属性（attribute）和关联（relationship）不能带有相同的名字，也不能命名为 `type` 或 `id`

#### <a href="#document-resource-object-attributes" id="document-resource-object-attributes" class="headerlink"></a> Attributes

`attributes` 的值 **必须** 是一个对象（即一个 "attributes object"）。该对象的成员用于表示[resource object][resource objects]中定义的相关信息。

属性（attribute）中可以包含任意合法的JSON值。

复杂的数据结构包括JSON对象和数组是可以作为属性（attribute）的值的。不过要注意，
这些数据结构中的元素一定 **不能** 包含 `relationshiops` 或 `links` 成员，
这些成员目前在本协定中处于保留状态，将来会作为其他用途使用。

尽管hasOne外键（例如 `author_id`）经常在资源对象中与其他信息一起存储，但这些键 **不应** 作为属性出现。

> 提示：参考 [fields] 和 [member names] 获取更多有关该容器的限制。

> Note: See [fields] and [member names] for more restrictions on this container.

#### <a href="#document-resource-object-relationships" id="document-resource-object-relationships" class="headerlink"></a> Relationships

`relationships` 的值 **必须** 为一个对象（一个 "relationships"对象）。该对象的成员表示
该 [resource object][resource objects] 对其他资源对象的引用关系。

这个关系可以是一对一也可以是一对多的。

一个 "relation object" 关联对象 **必须** 包含以下至少一个元素：

* `links`: 一个[links object][links] 包含以下至少一个元素：
  * `self`: 表示关联本身的引用。该引用允许客户端直接对关联进行操作。例如，
    通过`article`的关联URL移除`author`元素时会断开`article`中人的链接，同时不删除`people`资源本身。
    获取成功后，该连接会返回 [linkage][resource linkage] 相关资源作为其主要数据。
    （参考 [Fetching Relationships](#fetching-relationships).）
  * `related`: 一个 [related resource link]
* `data`: [resource linkage]
* `meta`: 一个 [meta object][meta]对象，包含了有关关联的非标准元数据信息。

一个代表一对多（to-many）关系的关联（relationship）对象 **可能** 在`links`成员中也包含了 [pagination] 连接，正如下方所描述的一样。

> 提示：参考 [fields] 和 [member names] 获取该容器的更多限制信息。

#### <a href="#document-resource-object-related-resource-links" id="document-resource-object-related-resource-links" class="headerlink"></a> Related Resource Links

一个 “关联资源连接（related resource link）” 提供了到 一个[relationship][relationships]中 [resource objects][resource objects] [linked][links]的连接。
获取完毕后，相关的资源对象会作为相应的主要数据而被返回。

举例来说，一个 `article`的 `comments` [relationship][relationships] 可以指定一个 [link][links]，通过 `GET` 请求时可以获取
一系列评论数据 [resource objects]

如需定义该链接的话，该关联资源链接 **必须** 引用到一个合法的URL，即便是关联本身目前没有连接到任何目标资源。
此外关联的内容发生变化时，相关资源连接 **不应** 被修改。

#### <a href="#document-resource-object-linkage" id="document-resource-object-linkage" class="headerlink"></a> Resource Linkage

[compound document] 中的资源链接（resource linkage）允许客户端在不使用 `GET` 获取 [links] 的情况下将所有的 [resource objects]链接在一起。

资源链接（resource linkage） **必须** 为以下列出的其中一种：

Resource linkage **MUST** be represented as one of the following:

* 对于空的对一（to-one）关系，使用 `null`
* 对于空的对多（to-many）关系，使用空数组(`[]`)
* 对于非空的对一关系，使用一个 [resource identifier object]
* 对于非空的对多关系，使用一个 [resource identifier objects][resource identifier objet] 数组

> 提示：本规范没有定义对多关系数组中资源标识符（resource identifier objects）的顺序，虽然具体实现中可能会对数组进行排序。
资源标识符数组可能会以排序或未排序的关系（relationship）出现，获得响应时这两种情况都有可能出现。

例如，下面的文章与 `author` 进行了关联：

```json
// ...
{
  "type": "articles",
  "id": "1",
  "attributes": {
    "title": "Rails is Omakase"
  },
  "relationships": {
    "author": {
      "links": {
        "self": "http://example.com/articles/1/relationships/author",
        "related": "http://example.com/articles/1/author"
      },
      "data": { "type": "people", "id": "9" }
    }
  },
  "links": {
    "self": "http://example.com/articles/1"
  }
}
// ...
```

`author` 关系中包含了一个到自身的引用（允许客户端直接修改相关作者），一个用于获取资源对象以及链接信息的关联资源链接。

#### <a href="#document-resource-object-links" id="document-resource-object-links" class="headerlink"></a> 资源Links

[resource object][resource objects]中的可选成员 `links` 包含了资源相关的 [links]

如果存在该成员，该链接对象 **可能** 会有一个 `self` [link][links]，可用于
识别资源对象对应的资源。

```json
// ...
{
  "type": "articles",
  "id": "1",
  "attributes": {
    "title": "Rails is Omakase"
  },
  "links": {
    "self": "http://example.com/articles/1"
  }
}
// ...
```

服务器在收到获取指定URL的 `GET` 请求时 **一定** 会响应并返回所请求的资源作为主要数据。

### <a href="#document-resource-identifier-objects" id="document-resource-identifier-objects" class="headerlink"></a> 资源标识符对象

 “资源标识符对象（resource identifier object）” 是一个用于识别某个资源的对象。

“资源标识符对象” **一定** 会包含 `type` 和 `id` 成员。

“资源标识符对象” **可能** 也会包含有一个 `meta` 成员，其值为存储有非标准元数据的 [meta] 对象。

### <a href="#document-compound-documents" id="document-compound-documents" class="headerlink"></a> 复合文档

出于减少HTTP请求数量的目的，服务器 **可能** 在响应请求时将相关资源与同请求的资源一起发送。
像类似这样的服务器响应叫做“复合文档（compound documents）”。

在复合文档中，所有包含的资源 **一定** 会以[resource objects]数组的形式在 `included` 成员中出现。

复合文档要求具有“完整链接”属性，意即所有包含的资源 **必须** 在同一个文档内用至少一个
[resource identifier object]来标识。这些资源标识符对象可能是请求的数据的本身，也可能是
指向了请求数据或包含数据的资源链接。

对于完整链接要求来讲唯一的例外情况是，通过[sparse fieldsets] 排除关系字段（可能包含其他的链接数据）

> 提示：完整链接属性可以确保包含在内的资源要么和所请求的数据（也就是[resource objects] 
或 [resource identifier objects][resource identifier object]）相关，或者互相相关。

下方是一个完整的示例，包含了多个关联（relationships）

```json
{
  "data": [{
    "type": "articles",
    "id": "1",
    "attributes": {
      "title": "JSON API paints my bikeshed!"
    },
    "links": {
      "self": "http://example.com/articles/1"
    },
    "relationships": {
      "author": {
        "links": {
          "self": "http://example.com/articles/1/relationships/author",
          "related": "http://example.com/articles/1/author"
        },
        "data": { "type": "people", "id": "9" }
      },
      "comments": {
        "links": {
          "self": "http://example.com/articles/1/relationships/comments",
          "related": "http://example.com/articles/1/comments"
        },
        "data": [
          { "type": "comments", "id": "5" },
          { "type": "comments", "id": "12" }
        ]
      }
    }
  }],
  "included": [{
    "type": "people",
    "id": "9",
    "attributes": {
      "first-name": "Dan",
      "last-name": "Gebhardt",
      "twitter": "dgeb"
    },
    "links": {
      "self": "http://example.com/people/9"
    }
  }, {
    "type": "comments",
    "id": "5",
    "attributes": {
      "body": "First!"
    },
    "relationships": {
      "author": {
        "data": { "type": "people", "id": "2" }
      }
    },
    "links": {
      "self": "http://example.com/comments/5"
    }
  }, {
    "type": "comments",
    "id": "12",
    "attributes": {
      "body": "I like XML better"
    },
    "relationships": {
      "author": {
        "data": { "type": "people", "id": "9" }
      }
    },
    "links": {
      "self": "http://example.com/comments/12"
    }
  }]
}
```

对于每个 `type` 和 `id` 数值对，一个 [compound document] **不能** 包含多于一个 [resource object][resource objects]

> 提示：在文档中，您可以将 `type` 和 `id` 数据对看作整个文档中独一的 [resource objects]引用。

> 提示：该方法确保每个响应中唯一正确的 [resource object][resource objects]被返回，
即便是相同的资源被多次引用。

### <a href="#document-meta" id="document-meta" class="headerlink"></a> 元数据

`meta` 成员可以用于囊括非标准的元数据。`meta` 成员的值 **必须** 是一个对象（一个 "meta object"）。

`meta` 对象中 **可以** 指定任何成员。

例如：

```json
{
  "meta": {
    "copyright": "Copyright 2015 Example Corp.",
    "authors": [
      "Yehuda Katz",
      "Steve Klabnik",
      "Dan Gebhardt",
      "Tyler Kellen"
    ]
  },
  "data": {
    // ...
  }
}
```

### <a href="#document-links" id="document-links" class="headerlink"></a> Links

`links` 成员用来表示链接。`links` 成员的值 **必须** 为一个对象（一个 "links object"）。

links对象中的成员都是“链接（link）”。链接 **必须** 表示为以下两种的一种：

* 链接URL的字符串
* 该对象（链接对象）可以包含以下成员：
  * `href`: 表示链接URL的字符串
  * `meta`: 元数据对象，用于包含链接相关的非标准的元数据信息

下方的 `self` 链接为一个URL：

```json
"links": {
  "self": "http://example.com/posts"
}
```

下方的 `related` 链接中包含了一个URL以及相关资源集合的元数据。

```json
"links": {
  "related": {
    "href": "http://example.com/articles/1/comments",
    "meta": {
      "count": 10
    }
  }
}
```

> 提示：在将来，links对象以及link对象可能会包含更多额外的信息。此外，目前已有的
合法成员的值在将来可能会被扩展（例如，`collection`链接可以支持数组，而 `self`链接
则不支持）。

### <a href="#document-jsonapi-object" id="document-jsonapi-object" class="headerlink"></a> JSON API 对象

JSON API文档在 `jsonapi` 顶级成员下 **可能** 包含其具体的实现方法。
如果该成员存在，则 `jsonapi` 的值 **必须** 是一个对象（一个"jsonapi object"）。
jsonapi对象 **可能** 会有一个 `version` 成员，其值指定了支持的最高JSON API版本；
此外，该对象 **可能** 还有另一个 `meta` 成员，该成员的值是一个 [meta] 对象，
包含了非标准的元数据。

```json
{
  "jsonapi": {
    "version": "1.0"
  }
}
```

如果此处没有出现 `version` ，则客户端假定服务器端至少提供了1.0版本的支持。

> 提示：由于 JSON API 的版本更迭是累加的，因此版本字符串主要的作用是用于
告知用户服务器可能支持的新特性。

### <a href="#document-member-names" id="document-member-names" class="headerlink"></a> 成员名称

JSON API 文档中的所有成员命名无论对于服务器还是客户端来讲 **必须** 是大小写敏感的，
同时也 **必须** 满足以下所有条件：

- 成员名 **必须** 包含至少一个字符。
- 成员名 **必须** 仅包含下方所述的字符。
- 成员名 **必须** 以 “全局可用字符” 开始，以“全局可用字符”结束，如下方所示。

为了能方便地将成员名映射到URL中，建议您在指定成员名称时仅使用[RFC 3986](http://tools.ietf.org/html/rfc3986#page-13)中指定且非保留的URL安全字符。

#### <a href="#document-member-names-allowed-characters" id="document-member-names-allowed-characters" class="headerlink"></a> 可用字符

下列“全局可用字符” **可以** 在 成员名称中的任何位置使用：

The following "globally allowed characters" **MAY** be used anywhere in a member name:

- 从 U+0061 到 U+007A, "a-z"
- 从 U+0041 到 U+005A, "A-Z"
- 从 U+0030 到 U+0039, "0-9"
- U+0080 及以上 (non-ASCII Unicode characters; _not recommended, not URL safe_)

此外，以下字符也可以出现在成员名中，但不能出现在成员名名首或名尾。

- U+002D HYPHEN-MINUS, "-"
- U+005F LOW LINE, "_"
- U+0020 SPACE, " " _(not recommended, not URL safe)_

#### <a href="#document-member-names-reserved-characters" id="document-member-names-reserved-characters" class="headerlink"></a> 保留字符

以下字符 **不能** 在成员名中使用：

- U+002B PLUS SIGN, "+" _(used for ordering)_
- U+002C COMMA, "," _(used as a separator between relationship paths)_
- U+002E PERIOD, "." _(used as a separator within relationship paths)_
- U+005B LEFT SQUARE BRACKET, "[" _(used in sparse fieldsets)_
- U+005D RIGHT SQUARE BRACKET, "]" _(used in sparse fieldsets)_
- U+0021 EXCLAMATION MARK, "!"
- U+0022 QUOTATION MARK, '"'
- U+0023 NUMBER SIGN, "#"
- U+0024 DOLLAR SIGN, "$"
- U+0025 PERCENT SIGN, "%"
- U+0026 AMPERSAND, "&"
- U+0027 APOSTROPHE, "'"
- U+0028 LEFT PARENTHESIS, "("
- U+0029 RIGHT PARENTHESIS, ")"
- U+002A ASTERISK, "&#x2a;"
- U+002F SOLIDUS, "/"
- U+003A COLON, ":"
- U+003B SEMICOLON, ";"
- U+003C LESS-THAN SIGN, "<"
- U+003D EQUALS SIGN, "="
- U+003E GREATER-THAN SIGN, ">"
- U+003F QUESTION MARK, "?"
- U+0040 COMMERCIAL AT, "@"
- U+005C REVERSE SOLIDUS, "\"
- U+005E CIRCUMFLEX ACCENT, "^"
- U+0060 GRAVE ACCENT, "&#x60;"
- U+007B LEFT CURLY BRACKET, "{"
- U+007C VERTICAL LINE, "|"
- U+007D RIGHT CURLY BRACKET, "}"
- U+007E TILDE, "~"
- U+007F DELETE
- U+0000 to U+001F (C0 Controls)

#### <a href="#document-member-names-at-members" id="document-member-names-at-members" class="headerlink"></a> @-Members

成员名也 **可以** 以@符号起始(U+0040 COMMERCIAL AT, "@")。使用这种方式命名的成员被称为
"@-Members"。 @-Members **可以** 出现在 JSON API 文档的任意位置。

然而 JSON API 处理程序 **必须** 完全忽略@-Members（也就是说不把它们当作JSON API数据）

此外，在解析本章节之外的所有JSON API定义以及处理过程中 **必须** 忽略掉 @-Members。
例如在所有attribute对象之上定义的[attribute][attributes]。然而因为在解析定义时
必须忽略@-Members，因此attributes对象中出现的@-Member不是一个attribute。

> 提示：除此之外，"@" 成员可以用于向JSON API文档中添加JSON-LD数据。
类似像这样的数据应被看作是 [额外的头部（an extra header）](http://www.w3.org/TR/json-ld/#interpreting-json-as-json-ld)
用来告知JSON-LD客户端，表示该对象包含有JSON-LD 数据。

## <a href="#fetching" id="fetching" class="headerlink"></a> 获取数据

数据——资源和relationships也包括在内——都可以通过向端点发送 `GET` 请求来获取。

应答内容也可以通过下面的可选特性来做进一步定制。

Responses can be further refined with the optional features described below.

### <a href="#fetching-resources" id="fetching-resources" class="headerlink"></a> 获取资源

对于所有提供的URL，服务器 **必须** 支持如下数据的获取：

* `self` link对象，作为顶级links对象的一部分
* `self` link对象，作为resource links对象的一部分
* `related` link对象，作为relationship links对象的一部分

举例来说，下列请求会获取多个article。

```http
GET /articles HTTP/1.1
Accept: application/vnd.api+json
```

下方的请求获取一个article。

```http
GET /articles/1 HTTP/1.1
Accept: application/vnd.api+json
```

下方的请求获取article的author

```http
GET /articles/1/author HTTP/1.1
Accept: application/vnd.api+json
```

#### <a href="#fetching-resources-responses" id="fetching-resources-responses" class="headerlink"></a> 响应

##### <a href="#fetching-resources-responses-200" id="fetching-resources-responses-200" class="headerlink"></a> 200 OK

服务器 **应当** 向成功发起了获取某个资源或资源合集的请求响应 `200 OK`。

服务器 **应当** 向成功发起了获取某个以[resource objects]或空数组（`[]`）为表现形式的资源合集的请求响应文档的主要数据（primary data）。

例如，应当向一个请求article集合的 `GET` 返回：

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "http://example.com/articles"
  },
  "data": [{
    "type": "articles",
    "id": "1",
    "attributes": {
      "title": "JSON API paints my bikeshed!"
    }
  }, {
    "type": "articles",
    "id": "2",
    "attributes": {
      "title": "Rails is Omakase"
    }
  }]
}
```

一个类似的响应为空集合的请求为：

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "http://example.com/articles"
  },
  "data": []
}
```

服务器 **应当** 向成功地要求了某个资源的请求返回 [resource object][resource objects] 或是
'null'，作为该响应的主要数据（primary data）。

`null` 仅当在请求的URL是一个疑似单个资源但目前并不存在时被返回。

> 提示：考虑如下情况，例如考虑仅获取一个单一相关资源链接的请求。当relationship为空时（即该链接没有指定到任何资源上）
，则响应为 `null`，否则，应为单一相关资源的[resource object][resource objects]。

例如，请求单个article的 `GET` 请求可能如下：

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "http://example.com/articles/1"
  },
  "data": {
    "type": "articles",
    "id": "1",
    "attributes": {
      "title": "JSON API paints my bikeshed!"
    },
    "relationships": {
      "author": {
        "links": {
          "related": "http://example.com/articles/1/author"
        }
      }
    }
  }
}
```

如果上述请求中article的auther值为空，则到该资源的 `GET` 请求将会是：

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "http://example.com/articles/1/author"
  },
  "data": null
}
```

##### <a href="#fetching-resources-responses-404" id="fetching-resources-responses-404" class="headerlink"></a> 404 Not Found

服务器 **应当** 在处理获取单个不存在资源的请求时相应 `404 Not Found`。除非该请求接受
`200 OK` 且主数据为 `null` 的响应。

##### <a href="#fetching-resources-responses-other" id="fetching-resources-responses-other" class="headerlink"></a> 其他资源

服务器 **可能** 会返回其他HTTP状态码。

服务器 **可能** 返回带有[详细错误信息]的表示请求错误的响应。

服务器 **应当** 为请求返回响应，而客户端 **应当** 按照[`HTTP semantics`](http://tools.ietf.org/html/rfc7231)
来解读响应的意义。

### <a href="#fetching-relationships" id="fetching-relationships" class="headerlink"></a> 获取Relationships

对于所有 `links` 对象中提供了 `self` link的所有relationship URL，服务器 **应当** 支持
这些请求的relationship 数据获取。

例如，如下请求将会获取一篇文章的评论：

```http
GET /articles/1/relationships/comments HTTP/1.1
Accept: application/vnd.api+json
```

下方的请求用于获取文章的作者：

```http
GET /articles/1/relationships/author HTTP/1.1
Accept: application/vnd.api+json
```

#### <a href="#fetching-relationships-responses" id="fetching-relationships-responses" class="headerlink"></a> 响应

##### <a href="#fetching-relationships-responses-200" id="fetching-relationships-responses-200" class="headerlink"></a> 200 OK

服务器 **应当** 对成功获取了relationship的请求返回 `200 OK` 的响应。

响应文档中的主要数据值 **应当** 符合 [resource linkage] ，正如上面[relationship objects][relationships]所描述的一样。

顶级的 [links objects][link] **可以** 包含 `self` 以及 `related` 链接，
正如上方 [relationship objects][relationships] 描述的一样。

例如，使用 `GET` 获取一个对一(to-one) relationship链接可能会返回：

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "/articles/1/relationships/author",
    "related": "/articles/1/author"
  },
  "data": {
    "type": "people",
    "id": "12"
  }
}
```

如果请求的relationship为空，则 `GET` 请求获得的结果可能为：

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "/articles/1/relationships/author",
    "related": "/articles/1/author"
  },
  "data": null
}
```

使用 `GET` 获取一个对多（to-many）relationship 链接可能会返回：

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "/articles/1/relationships/tags",
    "related": "/articles/1/tags"
  },
  "data": [
    { "type": "tags", "id": "2" },
    { "type": "tags", "id": "3" }
  ]
}
```

如果请求的relationship为空，则 `GET` 请求获得的结果可能为：

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "/articles/1/relationships/tags",
    "related": "/articles/1/tags"
  },
  "data": []
}
```

##### <a href="#fetching-relationships-responses-404" id="fetching-relationships-responses-404" class="headerlink"></a> 404 Not Found

当请求获取的relationship链接URL指向的资源为空时，服务器 **应当** 返回 `404 Not Found`。

> 提示：当relationship的父资源不存在时就会发生这种情况。例如，当 `/articles/1` 不存在时，
对 `/articles/1/relationships/tags` 的访问请求会返回 `404 Not Found`。

如果一个 relationship 链接URL存在但relationship为空，则 **应当**返回 `200 OK`，正如上文所述。

##### <a href="#fetching-relationships-responses-other" id="fetching-relationships-responses-other" class="headerlink"></a> 其他相应

服务器 **可能** 会返回其他HTTP状态码。

服务器 **可能** 返回带有[详细错误信息]的表示请求错误的响应。

服务器 **应当** 为请求返回响应，而客户端 **应当** 按照[`HTTP semantics`](http://tools.ietf.org/html/rfc7231)
来解读响应的意义。

### <a href="#fetching-includes" id="fetching-includes" class="headerlink"></a> 包含相关资源

一个接口默认情况下 **可能** 会返回与主要数据相关的资源。

接口 **也可以** 支持 `include` 请求参数，允许客户端指定应返回的相关资源。

如果接口不支持 `include` 参数，则其 **必须** 向含有该参数的请求返回 `400 Bad Request`。

如果端点支持同时客户端的请求中也提供了 `include` 参数，则服务器返回的[compund document] 中
`included`字段 **不应** 包含未被请求的其他[resource objects]。

`include` 参数中的值，即relationship路径列表 **应该** 使用逗号分隔(U+002C
COMMA, ",")。relationship 路径应是使用句点符号(U+002E FULL-STOP, ".")分隔的[relationship][relationships]名称列表。

如果服务器无法定位relationship路径，或不支持路径中包含资源信息，则服务器 **必须** 返回 400 Bad Request。

> 提示：例如，relationship路径看起来可能是这样的 `comments.author`，即 `comments` 属于某个
`articles` [resource object][resource objects] 的relationship，而 `author` 属于
`comments` [resource object][resource objects] 的relationship。

举个例子，在请求文章的同时携带评论：

```http
GET /articles/1?include=comments HTTP/1.1
Accept: application/vnd.api+json
```

为了请求其他相关的资源，使用句点分隔路径来指定每个relationship的名字：

```http
GET /articles/1?include=comments.author HTTP/1.1
Accept: application/vnd.api+json
```

> 提示：因为 [compound documents][compound document] 要求获取完整的链接内容
（除非relationship链接内容被sparse fieldset排除在外），路径不同部分的中间资源（intermediate resources）一定会与
子节点一同被返回。例如，对于获取 `comments.author` 的请求，其响应值应囊括 `comments`，
以及这些　`comments` 中的 `author`。

> 提示：服务器可能会利用
别名提供深层嵌套的relationship，例如 `comments.author`，这时候就可以，将对资源的访问简化为 `comment-auhtors`。这样一来就使得 `/articles/1?include=comment-authors`
这样的请求成为了可能，从而替代 `/articles/1?include=comments.author`这样的请求。
通过利用别名来抽象嵌套relationship，服务器仍然可以在复合文档中提供完全的链接内容访问，
同时无需加入不需要的中间资源。

请求中可以使用逗号分隔多个相关资源：

```http
GET /articles/1?include=author,comments.author HTTP/1.1
Accept: application/vnd.api+json
```

不仅如此，还可以从relationship接口中获取到相关的资源

```http
GET /articles/1/relationships/comments?include=comments.author HTTP/1.1
Accept: application/vnd.api+json
```

这样一来，响应的主要数据即为[resource identifier objects][resource identifier object]集合
，即用于获取某篇文章所有评论的链接，同时所有评论以及评论作者数据都会在服务器返回被包含。

> 提示：本章节的内容适用于任何响应主要数据（primary data）的接口，与请求的类型无关。
例如，服务器会为 `POST` 请求创建资源或relationship时，支持请求中包含相关资源的信息。

### <a href="#fetching-filtering" id="fetching-filtering" class="headerlink"></a> 过滤

`filter` 查询参数属于保留参数，用于过滤数据。Filters(过滤器)是集合（collection）的视图（view），服务器与客户端
**应当** 可以利用该键值进行过滤操作。

> 提示：服务器具体支持什么策略对于JSON API来说是无关紧要的。 `filter` 查询参数可以作为其他任意过滤策略的基础。

## <a href="#query-parameters" id="query-parameters" class="headerlink"></a> 查询参数

实现特定的查询参数 **必须** 遵守与 [member names] 相同的约定，它们 **必须** 包含至少一个
a-z 字符(U+0061 to U+007A)。 **推荐** 使用U+002D HYPHEN-MINUS, "-", U+005F LOW LINE, "_",
或大写字母（例如 camelCasing）

如果服务器接到了不符合上述命名规则的查询参数，同时服务器也不知道应该如何根据本说明来处理该参数，
则服务器 **应该** 返回 `400 Bad Request`。

> 提示：该规则可以确保JSON API在不与现有实现产生冲突的前提下添加更多的标准查询参数。
