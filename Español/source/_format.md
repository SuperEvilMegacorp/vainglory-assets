# <a href="#document-resource-objects" id="document-resource-objects" class="headerlink"></a> Objetos De Recursos

"Objetos de recursos" aparecen en un documento JSON API para representar recursos.
 
Un objeto de recurso **DEBE** contener al menos los siguientes miembros top-level:
 
* `id`
* `type`
 
Excepción: El miembro `id` no es necesario cuando el objeto de recurso se origina al cliente y representa un nuevo recurso a ser creado en el servidor.
 
Además, un objeto de recurso **PUEDE** contener cualquiera de los siguientes miembros top-level:
 
* `attributes`: un [attributes object][attributes] representando algunos de los datos de los recursos.
* `relationships`: un [relationships object][relationships] describiendo relaciones entre el recurso y otros otros JSON API
* `links`: un [links object][links] conteniendo enlaces relacionados al recurso.
 
Asi se podria ver un artículo (es decir un recurso de tipo “articles”) puede verse en un documento:

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

#### <a href="#document-resource-object-identification" id="document-resource-object-identification" class="headerlink"></a> Identificación

Cada [resource object][resource objects] **DEBE** contener un miembro `id` y un miembro `type`.
Los valores de los miembros `id` y `type` **DEBEN** ser strings.
 
En un API, cada par de `type` y `id`  de cada objeto de recurso **DEBE**
Identificar un recurso único. (El set de URIs controlados por un servidor, o varios servidores actuando como uno, constituyen un API.)
 
El miembro `type` es utilizado para describir [resource objects] que comparten atributos y relaciones comunes.
 
Los valores de miembros `type` **DEBEN** adherir las mismas restricciones que [member names].
 
> Note: Esta especulación es agnóstica sobre reglas de infección, así que el valor de `type` puede ser plural o singular. Aun así, el mismo valor debería ser utilizado consistentemente en un implementación.

#### <a href="#document-resource-object-fields" id="document-resource-object-fields" class="headerlink"></a> Campos

Los objetos de un recurso [attributes] y sus [relationships] son llamados juntos sus "[fields]".
 
Campos para un [resource object][resource objects] **DEBEN** compartir un espacio de nombres entre sí y con `type` y `id`. En otras palabras, un recurso no puede tener un atributo y relación con el mismo nombre, ni tener una relación o atributo llamados `type` o `id`.

#### <a href="#document-resource-object-attributes" id="document-resource-object-attributes" class="headerlink"></a> Atributos

El valor de la clave `attributes` **DEBE** ser un objeto (an "attributes object"). Los miembros de los objetos de atributo ("attributes") representan información acerca del [resource object][resource objects] en el que está definido.
 
Atributos pueden contener cualquier valor JSON válido.

Estructuras de información compleja que involucra objetos y arreglos JSON están permitidos como valores de atributos. Sin embargo, cualquier objeto que constituye o está contenido en un atributo ** NO DEBE** contener  un `relationships` o `links`miembro, ya que esos miembros están reservados por esta especificación para futuro uso.
 
Aunque tenga una llave extranjera (e.g. `author_id`) a menudo son almacenados internamente junto a otra información para ser representado en un objeto de recurso, estas llaves **NO DEBERIA** aparecer como atributos
 
> Note: Mira [campos] y [nombres de miembros] para más restricciones en este contenedor. 

#### <a href="#document-resource-object-relationships" id="document-resource-object-relationships" class="headerlink"></a> Relaciones

El valor de las llaves `relationships`**DEBE** ser un objeto (a "relationships
object"). Miembros de las relaciones de objeto  ("relationships")  representan referencias del [resource object][resource objects] en el cual está definido para otros recursos de objetos.

Las relaciones pueden ser to-one o to-many.

Un "relationship object" **DEBE** contener al menos uno de lo siguiente:
 
* `links`: Un [links object][links] conteniendo al menos uno de los siguientes:
  * `self`: Un enlace para la relación en sí (un "enlace de relación"). Este enlace autoriza al cliente a directamente manipular la relación. Por ejemplo, quitar un `author` a través de la relación URL de un `article` desconectará a la persona del `article` sin quitar el recurso `people`.
    Cuando extraído correctamente, este enlace te devuelve el [linkage][resource linkage] para los recursos relacionados como sus datos primarios.
    (Ve [Fetching Relationships](#fetching-relationships).)
  * `related`: un [related resource link]
* `data`: [resource linkage]
* `meta`: Un[meta object][meta] que contiene meta-información no estándar sobre la relación.
 
Un objeto relación que representa una relación to-many **PUEDE** también contener [pagination] enlaces bajo el miembro `links`, como descrito debajo.
 
> Nota: Ve [fields] y [member names] para más restricciones en este container.

#### <a href="#document-resource-object-related-resource-links" id="document-resource-object-related-resource-links" class="headerlink"></a> Enlaces de Recursos Relacionados

Un "related resource link" proporciona acceso a [resource objects][resource objects] [linked][links] en un [relationship][relationships]. Cuando extraído, el related resource object(s) son devueltos como los datos primarios de una respuesta.
 
Por ejemplo, los `comments` del `article` [relationship][relationships] podría especificar un [link][links] que devuelve una colección de comment [resource objects] cuando recogidos a través de una petición `GET`.
 
Si presente, un related resource link **DEBE** mencionar una URL válida, incluso si la relación no está actualmente asociada con algún target resource. Además, un related resource link **NO PUEDE** cambiar porque su contenido de relación cambia.

#### <a href="#document-resource-object-linkage" id="document-resource-object-linkage" class="headerlink"></a> Vinculación de recursos

Vinculación de recursos en un [compound document] permite al cliente a enlazar juntos todos los [resource objects] incluidos sin tener que `GET` algún URL vía [links].
  
Vinculación de recursos **DEBE** que ser representado como uno de los siguientes:

* `null` para las relaciones to-one.
* Una colección vacía (`[]`) para relaciones to-many.
* Un solo [resource identifier object] para relaciones to-one no vacías.
* Una colección de [resource identifier objects][resource identifier object] para relaciones to-many no vacías.
>Notación: Las especificaciones no dan significado al orden de resource identifier objects en “linkage arrays” de relaciones to-many, pero implementaciones podrían hacerlo. Colecciones de resource identifier objects pueden representar relaciones ordenadas o desordenadas, y ambos tipos pueden ser mezclados en un objeto respuesta.
 
Por ejemplo, el siguiente artículo está asociado con un  `author`;

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

La relación `author` incluye un enlace para la relación en sí ( cual permite al cliente cambiar el autor relacionado directamente), un enlace de un recurso relacionado para coleccionar los objetos de recurso, y información “linkage”.

#### <a href="#document-resource-object-links" id="document-resource-object-links" class="headerlink"></a> Enlaces De Recursos

Los opcionales miembros `links` dentro de cada [resource object][resource objects] contiene [links] relacionados al recurso.
 
Si presente, este objeto enlace **PUEDE** contener un `self` [link][links] que identifica el recurso recurso representado por el objeto recurso.
 


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

Un servidor **DEBE** responder a una solicitud `GET` a una URL especificada con una respuesta que incluye el recurso como datos primarios.

### <a href="#document-resource-identifier-objects" id="document-resource-identifier-objects" class="headerlink"></a> Recurso Identificador de Objetos

Un “recurso identificador de objeto” es un objeto que identifica un recurso individual. 
 
Un “recurso identificador de objeto” **DEBE** contener `type` y `id` de los miembros. 
 
Un “recurso identificador de objeto” **DEBE** también incluir un `meta` de miembro, cuyo valor es un objeto [meta] que contenga información de meta no estándar.  

### <a href="#document-compound-documents" id="document-compound-documents" class="headerlink"></a> Documentos Compuestos 

Para reducir el número de peticiones de HTTP, los servidores **PUEDEN** permitir respuestas que incluyan recursos relacionados junto con los primeros recursos pedidos. Estas respuestas son llamadas “compound documents”. 
 
En un documento compuesto, todos los recursos incluidos **DEBEN** ser representados como una formación de [objetos de recurso] en un nivel superior `included` el miembro.
 
Los documentos compuestos requieren “enlace completo”, esto quiere decir que cada recurso incluido **DEBE** ser identificado por al menos [recurso identificador de objetos] en el mismo documento. Estos recursos identificadores de objetos pueden ser de información primaria o representante de enlace de recursos contenidos por la primaria o recursos incluidos. 
 
La única excepción para el requerimiento de enlace completo es cuando los archivos relacionados que de otra manera contendrían información de enlace son excluidos via [conjunto de campos disperso](#fetching-sparse-fieldsets).
 
> Nota: El enlace completo asegura que los recursos incluidos están relacionados ya sea con la información primaria (la cual puede ser [resource objects] o [resource identifier objects][resource identifier object]) o el uno al otro. 
 
Una muestra completa del documento incluido con múltiples relaciones:

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

Un [documento compuesto] **NO DEBE** incluir más de un [objeto de recurso][objeto de recurso] para cada par `type`y `id`.
 
> Nota: En un documento singular, puedes pensar en el `type` y `id` como una llave compuesta que únicamente se refiere a [resource objects] en otra parte del documento.
 
> Nota: Esta aproximación segura que un [resource object][resource objects] singular canonical es devuelto con cada respuesta, incluso cuando el mismo recurso es referido varias veces.

### <a href="#document-meta" id="document-meta" class="headerlink"></a> Información Meta

Donde especificado, un miembro `meta` puede ser utilizado para incluir no-standard información-meta. El valor de cada miembro `meta` **DEBE** ser un objeto(un "meta object").
 
Cualquier miembro **PUEDE** ser especificado dentro de objetos `meta`.
 
Por ejemplo:

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

### <a href="#document-links" id="document-links" class="headerlink"></a> Enlaces

Donde especificado un miembro `links` puede ser utilizado para representar enlaces. El valor de cada miembro `links` **DEBE** ser un objeto (un "links object").
 
Cada miembro de un objeto enlace es un "enlace". Un enlace **DEBE** ser representado como uno o otro:
 
* un cuerda conteniendo el URL del enlace.
* un objeto ("link object") que puede contener los siguientes los siguientes miembros:
  * `href`: una cuerda conteniendo el URL del link.
  * `meta`: un objeto meta conteniendo no-standard información-meta sobre el link.
 
El siguiente enlace `self` es simplemente un URL:

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
