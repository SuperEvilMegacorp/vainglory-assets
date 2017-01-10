# <a href="#document-resource-objects" id="document-resource-objects" class="headerlink"></a> Resource Objects

"Resource objects" appear in a JSON API document to represent resources.

A resource object **MUST** contain at least the following top-level members:

* `id`
* `type`

Exception: The `id` member is not required when the resource object originates at
the client and represents a new resource to be created on the server.

In addition, a resource object **MAY** contain any of these top-level members:

* `attributes`: an [attributes object][attributes] representing some of the resource's data.
* `relationships`: a [relationships object][relationships] describing relationships between
 the resource and other JSON API resources.
* `links`: a [links object][links] containing links related to the resource.

Here's how an article (i.e. a resource of type "articles") might appear in a document:

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

Every [resource object][resource objects] **MUST** contain an `id` member and a `type` member.
The values of the `id` and `type` members **MUST** be strings.

Within a given API, each resource object's `type` and `id` pair **MUST**
identify a single, unique resource. (The set of URIs controlled by a server,
or multiple servers acting as one, constitute an API.)

The `type` member is used to describe [resource objects] that share common
attributes and relationships.

The values of `type` members **MUST** adhere to the same constraints as
[member names].

> Note: This spec is agnostic about inflection rules, so the value of `type`
can be either plural or singular. However, the same value should be used
consistently throughout an implementation.

#### <a href="#document-resource-object-fields" id="document-resource-object-fields" class="headerlink"></a> Fields

A resource object's [attributes] and its [relationships] are collectively called
its "[fields]".

Fields for a [resource object][resource objects] **MUST** share a common namespace with each
other and with `type` and `id`. In other words, a resource can not have an
attribute and relationship with the same name, nor can it have an attribute
or relationship named `type` or `id`.

#### <a href="#document-resource-object-attributes" id="document-resource-object-attributes" class="headerlink"></a> Attributes

The value of the `attributes` key **MUST** be an object (an "attributes
object"). Members of the attributes object ("attributes") represent information
about the [resource object][resource objects] in which it's defined.

Attributes may contain any valid JSON value.

Complex data structures involving JSON objects and arrays are allowed as
attribute values. However, any object that constitutes or is contained in an
attribute **MUST NOT** contain a `relationships` or `links` member, as those
members are reserved by this specification for future use.

Although has-one foreign keys (e.g. `author_id`) are often stored internally
alongside other information to be represented in a resource object, these keys
**SHOULD NOT** appear as attributes.

> Note: See [fields] and [member names] for more restrictions on this container.

#### <a href="#document-resource-object-relationships" id="document-resource-object-relationships" class="headerlink"></a> Relationships

The value of the `relationships` key **MUST** be an object (a "relationships
object"). Members of the relationships object ("relationships") represent
references from the [resource object][resource objects] in which it's defined to other resource
objects.

Relationships may be to-one or to-many.

A "relationship object" **MUST** contain at least one of the following:

* `links`: a [links object][links] containing at least one of the following:
  * `self`: a link for the relationship itself (a "relationship link"). This
    link allows the client to directly manipulate the relationship. For example,
    removing an `author` through an `article`'s relationship URL would disconnect
    the person from the `article` without deleting the `people` resource itself.
    When fetched successfully, this link returns the [linkage][resource linkage]
    for the related resources as its primary data.
    (See [Fetching Relationships](#fetching-relationships).)
  * `related`: a [related resource link]
* `data`: [resource linkage]
* `meta`: a [meta object][meta] that contains non-standard meta-information about the
  relationship.

A relationship object that represents a to-many relationship **MAY** also contain
[pagination] links under the `links` member, as described below.

> Note: See [fields] and [member names] for more restrictions on this container.

#### <a href="#document-resource-object-related-resource-links" id="document-resource-object-related-resource-links" class="headerlink"></a> Related Resource Links

A "related resource link" provides access to [resource objects][resource objects] [linked][links]
in a [relationship][relationships]. When fetched, the related resource object(s)
are returned as the response's primary data.

For example, an `article`'s `comments` [relationship][relationships] could
specify a [link][links] that returns a collection of comment [resource objects]
when retrieved through a `GET` request.

If present, a related resource link **MUST** reference a valid URL, even if the
relationship isn't currently associated with any target resources. Additionally,
a related resource link **MUST NOT** change because its relationship's content
changes.

#### <a href="#document-resource-object-linkage" id="document-resource-object-linkage" class="headerlink"></a> Resource Linkage

Resource linkage in a [compound document] allows a client to link together all
of the included [resource objects] without having to `GET` any URLs via [links].

Resource linkage **MUST** be represented as one of the following:

* `null` for empty to-one relationships.
* an empty array (`[]`) for empty to-many relationships.
* a single [resource identifier object] for non-empty to-one relationships.
* an array of [resource identifier objects][resource identifier object] for non-empty to-many relationships.

> Note: The spec does not impart meaning to order of resource identifier
objects in linkage arrays of to-many relationships, although implementations
may do that. Arrays of resource identifier objects may represent ordered
or unordered relationships, and both types can be mixed in one response
object.

For example, the following article is associated with an `author`:

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

The `author` relationship includes a link for the relationship itself (which
allows the client to change the related author directly), a related resource
link to fetch the resource objects, and linkage information.

#### <a href="#document-resource-object-links" id="document-resource-object-links" class="headerlink"></a> Resource Links

The optional `links` member within each [resource object][resource objects] contains [links]
related to the resource.

If present, this links object **MAY** contain a `self` [link][links] that
identifies the resource represented by the resource object.

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

A server **MUST** respond to a `GET` request to the specified URL with a
response that includes the resource as the primary data.

### <a href="#document-resource-identifier-objects" id="document-resource-identifier-objects" class="headerlink"></a> Resource Identifier Objects

A "resource identifier object" is an object that identifies an individual
resource.

A "resource identifier object" **MUST** contain `type` and `id` members.

A "resource identifier object" **MAY** also include a `meta` member, whose value is a [meta] object that
contains non-standard meta-information.

### <a href="#document-compound-documents" id="document-compound-documents" class="headerlink"></a> Compound Documents

To reduce the number of HTTP requests, servers **MAY** allow responses that
include related resources along with the requested primary resources. Such
responses are called "compound documents".

In a compound document, all included resources **MUST** be represented as an
array of [resource objects] in a top-level `included` member.

Compound documents require "full linkage", meaning that every included
resource **MUST** be identified by at least one [resource identifier object]
in the same document. These resource identifier objects could either be
primary data or represent resource linkage contained within primary or
included resources.

The only exception to the full linkage requirement is when relationship fields
that would otherwise contain linkage data are excluded via [sparse fieldsets](#fetching-sparse-fieldsets).

> Note: Full linkage ensures that included resources are related to either
the primary data (which could be [resource objects] or [resource identifier
objects][resource identifier object]) or to each other.

A complete example document with multiple included relationships:

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

A [compound document] **MUST NOT** include more than one [resource object][resource objects] for
each `type` and `id` pair.

> Note: In a single document, you can think of the `type` and `id` as a
composite key that uniquely references [resource objects] in another part of
the document.

> Note: This approach ensures that a single canonical [resource object][resource objects] is
returned with each response, even when the same resource is referenced
multiple times.

### <a href="#document-meta" id="document-meta" class="headerlink"></a> Meta Information

Where specified, a `meta` member can be used to include non-standard
meta-information. The value of each `meta` member **MUST** be an object (a
"meta object").

Any members **MAY** be specified within `meta` objects.

For example:

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

Where specified, a `links` member can be used to represent links. The value
of each `links` member **MUST** be an object (a "links object").

Each member of a links object is a "link". A link **MUST** be represented as
either:

* a string containing the link's URL.
* an object ("link object") which can contain the following members:
  * `href`: a string containing the link's URL.
  * `meta`: a meta object containing non-standard meta-information about the
    link.

The following `self` link is simply a URL:

```json
"links": {
  "self": "http://example.com/posts"
}
```

The following `related` link includes a URL as well as meta-information
about a related resource collection:

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

> Note: Additional members may be specified for links objects and link
objects in the future. It is also possible that the allowed values of
additional members will be expanded (e.g. a `collection` link may support an
array of values, whereas a `self` link does not).

### <a href="#document-jsonapi-object" id="document-jsonapi-object" class="headerlink"></a> JSON API Object

A JSON API document **MAY** include information about its implementation
under a top level `jsonapi` member. If present, the value of the `jsonapi`
member **MUST** be an object (a "jsonapi object"). The jsonapi object **MAY**
contain a `version` member whose value is a string indicating the highest JSON
API version supported. This object **MAY** also contain a `meta` member, whose
value is a [meta] object that contains non-standard meta-information.

```json
{
  "jsonapi": {
    "version": "1.0"
  }
}
```

If the `version` member is not present, clients should assume the server
implements at least version 1.0 of the specification.

> Note: Because JSON API is committed to making additive changes only, the
version string primarily indicates which new features a server may support.

### <a href="#document-member-names" id="document-member-names" class="headerlink"></a> Member Names

All member names used in a JSON API document **MUST** be treated as case sensitive
by clients and servers, and they **MUST** meet all of the following conditions:

- Member names **MUST** contain at least one character.
- Member names **MUST** contain only the allowed characters listed below.
- Member names **MUST** start and end with a "globally allowed character",
  as defined below.

To enable an easy mapping of member names to URLs, it is **RECOMMENDED** that
member names use only non-reserved, URL safe characters specified in [RFC 3986](http://tools.ietf.org/html/rfc3986#page-13).

#### <a href="#document-member-names-allowed-characters" id="document-member-names-allowed-characters" class="headerlink"></a> Allowed Characters

The following "globally allowed characters" **MAY** be used anywhere in a member name:

- U+0061 to U+007A, "a-z"
- U+0041 to U+005A, "A-Z"
- U+0030 to U+0039, "0-9"
- U+0080 and above (non-ASCII Unicode characters; _not recommended, not URL safe_)

Additionally, the following characters are allowed in member names, except as the
first or last character:

- U+002D HYPHEN-MINUS, "-"
- U+005F LOW LINE, "_"
- U+0020 SPACE, " " _(not recommended, not URL safe)_

#### <a href="#document-member-names-reserved-characters" id="document-member-names-reserved-characters" class="headerlink"></a> Reserved Characters

The following characters **MUST NOT** be used in member names:

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

Member names **MAY** also begin with an at sign (U+0040 COMMERCIAL AT, "@").
Members named this way are called "@-Members". @-Members **MAY** appear
anywhere in a JSON API document.

However, JSON API processors **MUST** completely ignore @-Members (i.e. not
treat them as JSON API data).

Moreover, the existence of @-Members **MUST** be ignored when interpreting all
JSON API definitions and processing instructions given outside of this
subsection. For example, an [attribute][attributes] is defined above as any
member of the attributes object. However, because @-Members must be ignored
when interpreting that definition, an @-Member that occurs in an attributes
object is not an attribute.

> Note: Among other things, "@" members can be used to add JSON-LD data to a
JSON API document. Such documents should be served with [an extra header](http://www.w3.org/TR/json-ld/#interpreting-json-as-json-ld)
to convey to JSON-LD clients that they contain JSON-LD data.

## <a href="#fetching" id="fetching" class="headerlink"></a> Fetching Data

Data, including resources and relationships, can be fetched by sending a
`GET` request to an endpoint.

Responses can be further refined with the optional features described below.

### <a href="#fetching-resources" id="fetching-resources" class="headerlink"></a> Fetching Resources

A server **MUST** support fetching resource data for every URL provided as:

* a `self` link as part of the top-level links object
* a `self` link as part of a resource-level links object
* a `related` link as part of a relationship-level links object

For example, the following request fetches a collection of articles:

```http
GET /articles HTTP/1.1
Accept: application/vnd.api+json
```

The following request fetches an article:

```http
GET /articles/1 HTTP/1.1
Accept: application/vnd.api+json
```

And the following request fetches an article's author:

```http
GET /articles/1/author HTTP/1.1
Accept: application/vnd.api+json
```

#### <a href="#fetching-resources-responses" id="fetching-resources-responses" class="headerlink"></a> Responses

##### <a href="#fetching-resources-responses-200" id="fetching-resources-responses-200" class="headerlink"></a> 200 OK

A server **MUST** respond to a successful request to fetch an individual
resource or resource collection with a `200 OK` response.

A server **MUST** respond to a successful request to fetch a resource
collection with an array of [resource objects] or an empty array (`[]`) as
the response document's primary data.

For example, a `GET` request to a collection of articles could return:

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

A similar response representing an empty collection would be:

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

A server **MUST** respond to a successful request to fetch an individual
resource with a [resource object][resource objects] or `null` provided as
the response document's primary data.

`null` is only an appropriate response when the requested URL is one that
might correspond to a single resource, but doesn't currently.

> Note: Consider, for example, a request to fetch a to-one related resource link.
This request would respond with `null` when the relationship is empty (such that
the link is corresponding to no resources) but with the single related resource's
[resource object][resource objects] otherwise.

For example, a `GET` request to an individual article could return:

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

If the above article's author is missing, then a `GET` request to that related
resource would return:

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

A server **MUST** respond with `404 Not Found` when processing a request to
fetch a single resource that does not exist, except when the request warrants a
`200 OK` response with `null` as the primary data (as described above).

##### <a href="#fetching-resources-responses-other" id="fetching-resources-responses-other" class="headerlink"></a> Other Responses

A server **MAY** respond with other HTTP status codes.

A server **MAY** include [error details] with error responses.

A server **MUST** prepare responses, and a client **MUST** interpret
responses, in accordance with
[`HTTP semantics`](http://tools.ietf.org/html/rfc7231).

### <a href="#fetching-relationships" id="fetching-relationships" class="headerlink"></a> Fetching Relationships

A server **MUST** support fetching relationship data for every relationship URL
provided as a `self` link as part of a relationship's `links` object.

For example, the following request fetches data about an article's comments:

```http
GET /articles/1/relationships/comments HTTP/1.1
Accept: application/vnd.api+json
```

And the following request fetches data about an article's author:

```http
GET /articles/1/relationships/author HTTP/1.1
Accept: application/vnd.api+json
```

#### <a href="#fetching-relationships-responses" id="fetching-relationships-responses" class="headerlink"></a> Responses

##### <a href="#fetching-relationships-responses-200" id="fetching-relationships-responses-200" class="headerlink"></a> 200 OK

A server **MUST** respond to a successful request to fetch a relationship
with a `200 OK` response.

The primary data in the response document **MUST** match the appropriate
value for [resource linkage], as described above for
[relationship objects][relationships].

The top-level [links object][links] **MAY** contain `self` and `related` links,
as described above for [relationship objects][relationships].

For example, a `GET` request to a URL from a to-one relationship link could
return:

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

If the above relationship is empty, then a `GET` request to the same URL would
return:

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

A `GET` request to a URL from a to-many relationship link could return:

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

If the above relationship is empty, then a `GET` request to the same URL would
return:

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

A server **MUST** return `404 Not Found` when processing a request to fetch
a relationship link URL that does not exist.

> Note: This can happen when the parent resource of the relationship
does not exist. For example, when `/articles/1` does not exist, request to
`/articles/1/relationships/tags` returns `404 Not Found`.

If a relationship link URL exists but the relationship is empty, then
`200 OK` **MUST** be returned, as described above.

##### <a href="#fetching-relationships-responses-other" id="fetching-relationships-responses-other" class="headerlink"></a> Other Responses

A server **MAY** respond with other HTTP status codes.

A server **MAY** include [error details] with error responses.

A server **MUST** prepare responses, and a client **MUST** interpret
responses, in accordance with
[`HTTP semantics`](http://tools.ietf.org/html/rfc7231).

### <a href="#fetching-includes" id="fetching-includes" class="headerlink"></a> Inclusion of Related Resources

An endpoint **MAY** return resources related to the primary data by default.

An endpoint **MAY** also support an `include` request parameter to allow the
client to customize which related resources should be returned.

If an endpoint does not support the `include` parameter, it **MUST** respond
with `400 Bad Request` to any requests that include it.

If an endpoint supports the `include` parameter and a client supplies it,
the server **MUST NOT** include unrequested [resource objects] in the `included`
section of the [compound document].

The value of the `include` parameter **MUST** be a comma-separated (U+002C
COMMA, ",") list of relationship paths. A relationship path is a dot-separated
(U+002E FULL-STOP, ".") list of [relationship][relationships] names.

If a server is unable to identify a relationship path or does not support
inclusion of resources from a path, it **MUST** respond with 400 Bad Request.

> Note: For example, a relationship path could be `comments.author`, where
`comments` is a relationship listed under a `articles` [resource object][resource objects], and
`author` is a relationship listed under a `comments` [resource object][resource objects].

For instance, comments could be requested with an article:

```http
GET /articles/1?include=comments HTTP/1.1
Accept: application/vnd.api+json
```

In order to request resources related to other resources, a dot-separated path
for each relationship name can be specified:

```http
GET /articles/1?include=comments.author HTTP/1.1
Accept: application/vnd.api+json
```

> Note: Because [compound documents][compound document] require full linkage
(except when relationship linkage is excluded by sparse fieldsets), intermediate
resources in a multi-part path must be returned along with the leaf nodes. For
example, a response to a request for `comments.author` should include `comments`
as well as the `author` of each of those `comments`.

> Note: A server may choose to expose a deeply nested relationship such as
`comments.author` as a direct relationship with an alias such as
`comment-authors`. This would allow a client to request
`/articles/1?include=comment-authors` instead of
`/articles/1?include=comments.author`. By abstracting the nested
relationship with an alias, the server can still provide full linkage in
compound documents without including potentially unwanted intermediate
resources.

Multiple related resources can be requested in a comma-separated list:

```http
GET /articles/1?include=author,comments.author HTTP/1.1
Accept: application/vnd.api+json
```

Furthermore, related resources can be requested from a relationship endpoint:

```http
GET /articles/1/relationships/comments?include=comments.author HTTP/1.1
Accept: application/vnd.api+json
```

In this case, the primary data would be a collection of
[resource identifier objects][resource identifier object] that represent linkage to comments for an article,
while the full comments and comment authors would be returned as included data.

> Note: This section applies to any endpoint that responds with primary
data, regardless of the request type. For instance, a server could support
the inclusion of related resources along with a `POST` request to create a
resource or relationship.

### <a href="#fetching-sorting" id="fetching-sorting" class="headerlink"></a> Sorting

A server **MAY** choose to support requests to sort resource collections
according to one or more criteria ("sort fields").

> Note: Although recommended, sort fields do not necessarily need to
correspond to resource attribute and association names.

> Note: It is recommended that dot-separated (U+002E FULL-STOP, ".") sort
fields be used to request sorting based upon relationship attributes. For
example, a sort field of `author.name` could be used to request that the
primary data be sorted based upon the `name` attribute of the `author`
relationship.

An endpoint **MAY** support requests to sort the primary data with a `sort`
query parameter. The value for `sort` **MUST** represent sort fields.

```http
GET /people?sort=age HTTP/1.1
Accept: application/vnd.api+json
```

An endpoint **MAY** support multiple sort fields by allowing comma-separated
(U+002C COMMA, ",") sort fields. Sort fields **SHOULD** be applied in the
order specified.

```http
GET /people?sort=age,name HTTP/1.1
Accept: application/vnd.api+json
```

The sort order for each sort field **MUST** be ascending unless it is prefixed
with a minus (U+002D HYPHEN-MINUS, "-"), in which case it **MUST** be descending.

```http
GET /articles?sort=-created,title HTTP/1.1
Accept: application/vnd.api+json
```

The above example should return the newest articles first. Any articles
created on the same date will then be sorted by their title in ascending
alphabetical order.

If the server does not support sorting as specified in the query parameter
`sort`, it **MUST** return `400 Bad Request`.

If sorting is supported by the server and requested by the client via query
parameter `sort`, the server **MUST** return elements of the top-level
`data` array of the response ordered according to the criteria specified.
The server **MAY** apply default sorting rules to top-level `data` if
request parameter `sort` is not specified.

> Note: This section applies to any endpoint that responds with a resource
collection as primary data, regardless of the request type.

### <a href="#fetching-pagination" id="fetching-pagination" class="headerlink"></a> Pagination

A server **MAY** choose to limit the number of resources returned in a response
to a subset ("page") of the whole set available.

A server **MAY** provide links to traverse a paginated data set ("pagination
links").

Pagination links **MUST** appear in the links object that corresponds to a
collection. To paginate the primary data, supply pagination links in the
top-level `links` object. To paginate an included collection returned in
a [compound document], supply pagination links in the corresponding links
object.

The following keys **MUST** be used for pagination links:

* `first`: the first page of data
* `last`: the last page of data
* `prev`: the previous page of data
* `next`: the next page of data

Keys **MUST** either be omitted or have a `null` value to indicate that a
particular link is unavailable.

Concepts of order, as expressed in the naming of pagination links, **MUST**
remain consistent with JSON API's [sorting rules](#fetching-sorting).

The `page` query parameter is reserved for pagination. Servers and clients
**SHOULD** use this key for pagination operations.

> Note: JSON API is agnostic about the pagination strategy used by a server.
Effective pagination strategies include (but are not limited to):
page-based, offset-based, and cursor-based. The `page` query parameter can
be used as a basis for any of these strategies. For example, a page-based
strategy might use query parameters such as `page[number]` and `page[size]`,
an offset-based strategy might use `page[offset]` and `page[limit]`, while a
cursor-based strategy might use `page[cursor]`.

> Note: The example query parameters above use unencoded `[` and `]` characters
simply for readability. In practice, these characters must be percent-encoded,
per the requirements in [RFC 3986](http://tools.ietf.org/html/rfc3986#section-3.4).

> Note: This section applies to any endpoint that responds with a resource
collection as primary data, regardless of the request type.

### <a href="#fetching-filtering" id="fetching-filtering" class="headerlink"></a> Filtering

The `filter` query parameter is reserved for filtering data. Filters are views on collections,
and can Servers and clients
**SHOULD** use this key for filtering operations.

> Note: JSON API is agnostic about the strategies supported by a server. The
`filter` query parameter can be used as the basis for any number of filtering
strategies.

## <a href="#query-parameters" id="query-parameters" class="headerlink"></a> Query Parameters

Implementation specific query parameters **MUST** adhere to the same constraints
as [member names] with the additional requirement that they **MUST** contain at
least one non a-z character (U+0061 to U+007A). It is **RECOMMENDED** that a
U+002D HYPHEN-MINUS, "-", U+005F LOW LINE, "_", or capital letter is used
(e.g. camelCasing).

If a server encounters a query parameter that does not follow the naming
conventions above, and the server does not know how to process it as a query
parameter from this specification, it **MUST** return `400 Bad Request`.

> Note: This is to preserve the ability of JSON API to make additive additions
to standard query parameters without conflicting with existing implementations. -->
