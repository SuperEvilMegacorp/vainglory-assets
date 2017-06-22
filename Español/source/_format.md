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

El siguiente enlace `related` incluye una URL además de información-meta sobre una colección de un recurso relacionado:

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
> Note: Se pueden especificar miembros adicionales para los enlaces de objetos y vínculos Objetos en el futuro. También es posible que los valores Miembros adicionales serán expandidos (e.g. a `collection` link may support an array of values, whereas a `self` link does not).


### <a href="#document-jsonapi-object" id="document-jsonapi-object" class="headerlink"></a> JSON API Objeto

Un documento de JSON API **PUEDE** incluir información de el implementación
En un nivel alto  `jsonapi` miembro. Si está presente, el valor del `jsonapi`
miembro **DEBE** ser un objeto (a "jsonapi object"). El objeto de jsonapi **PUEDE**
contener un `versión` Un miembro cuyo valor es una cadena que indica la más alta JSON
API versión soportado. Este objeto **PUEDE** contener un `meta` miembro, cuyo valor es un [meta] objeto que contiene non-standard meta-información.

```json
{
  "jsonapi": {
    "version": "1.0"
  }
}
```

Si el `version` miembro no está presente, los clientes deben asumir el servidor implementa al menos la versión 1.0 de la especificación.

> Nota: Por qué JSON API está comprometido a hacer solo cambios aditivos, la versión primeramente indica cuáles nuevas características puede soportar un servidor.

### <a href="#document-member-names" id="document-member-names" class="headerlink"></a> Nombre De Miembros 

Todos los nombres de miembros usados en el documento  JSON API **DEBEN** ser tratados como un caso sensible por clientes y servidores, y ellos **DEBEN** conocer todas las condiciones siguientes:

- Nombres de miembros **DEBEN** contener al menos un carácter.
- Nombres de miembros **DEBEN** contener sólo los caracteres permitidos en la siguiente lista.
- Nombres de miembros **DEBEN** empezar y terminar con un “caracteres permitidos globalmenter”, como se    define abajo.

Para habilitar un fácil mapeo de nombres de miembros para URLs, Es **RECOMENDADO** que nombres de miembros usen solamente no-reservados, URL caracteres seguros especificados en [RFC 3986](http://tools.ietf.org/html/rfc3986#page-13).

#### <a href="#document-member-names-allowed-characters" id="document-member-names-allowed-characters" class="headerlink"></a> Caracteres Permitidos

Los siguientes “caracteres permitidos globalmente” **PUEDEN** ser usados donde sea en un nombre de miembro:
 
- U+0061 to U+007A, "a-z"
- U+0041 to U+005A, "A-Z"
- U+0030 to U+0039, "0-9"
- U+0080 y más (non-ASCII Unicode caracteres; _no recomendado, no seguro URL_)
 
Adicionalmente, los siguientes caracteres están permitidos en nombres de miembros, excepto como el primer o último carácter: 
 
- U+002D GUIÓN-MENOS, "-"
- U+005F LINEA BAJA, "_"
- U+0020 ESPACIO, " " _(no recomendado, no seguro URL)_

#### <a href="#document-member-names-reserved-characters" id="document-member-names-reserved-characters" class="headerlink"></a> Caracteres Reservados

Los siguientes caracteres **NO DEBEN** ser usados en nombres de miembros: 

- U+002B SÍMBOLO DE MÁS, "+" _(utilizado para ordenar)_
- U+002C COMA, "," _(utilizado como un separador entre caminos de relaciones)_
- U+002E PUNTO, "." _(utilizado como un separador entre caminos de relaciones)_
- U+005B CORCHETE IZQUIERDO, "[" _(utilizado en conjuntos de campos escasos)_
- U+005D CORCHETE DERECHO, "]" _(utilizado en conjuntos de campos escasos)_
- U+0021 SIGNO DE EXCLAMACIÓN, "!"
- U+0022 QUOTATION MARK, '"'
- U+0023 SÍMBOLO DE NÚMERO, "#"
- U+0024 SÍMBOLO DOLLAR, "$"
- U+0025 SÍMBOLO DE PORCENTAJE, "%"
- U+0026 AMPERSAND, "&"
- U+0027 APÓSTROFE, "'"
- U+0028 PARÉNTESIS IZQUIERDA, "("
- U+0029 PARÉNTESIS DERECHA, ")"
- U+002A ASTERISCO, "&#x2a;"
- U+002F SOLIDUS, "/"
- U+003A COLÓN, ":"
- U+003B PUNTO Y COMA, ";"
- U+003C SÍMBOLO ED MENOS QUÉ, "<"
- U+003D SÍMBOLO DE IGUAL, "="
- U+003E SÍMBOLO DE MÁS QUE, ">"
- U+003F SÍMBOLO DE PREGUNTA, "?"
- U+0040 ARROBA, "@"
- U+005C SOLIDUS REVERSO, "\"
- U+005E ACENTO CIRCUNFLEJO, "^"
- U+0060 ACENTO GRAVE, "&#x60;"
- U+007B PARÉNTESIS CURVADA IZQUIERDA, "{"
- U+007C LINEA VERTICAL, "|"
- U+007D PARÉNTESIS CURVADA DERECHA, "}"
- U+007E TÍLDE, "~"
- U+007F ELIMINAR
- U+0000 a U+001F (C0 Controles)

#### <a href="#document-member-names-at-members" id="document-member-names-at-members" class="headerlink"></a> @-Miembros

Nombres de miembros también **PUEDEN** pueden empezar con una arroba (U+0040 ARROBA, "@").
Miembros llamados de esta manera son llamados "@-Miembros". @-Miembros **PUEDEN** aparecer en cualquier parte en un documento JSON API.
 
Sin embargo, procesadores JSON API **DEBEN** ignorar completamente @-Miembros (es decir. No tratarlos como datos JSON API).
 
Además, las existencias de @-Members **DEBEN** ser ignoradas cuando interpretando todas las definiciones JSON API y procesando instrucciones dadas fuera de esta subsección. Por ejemplo, un [attribute][attributes] es definido arriba como cualquier miembro del objeto atributos. Sin embargo, porque @-Miembros debe ser ignorado cuando interpretando esa definición, un @-Miembro que ocurre en el objeto de un atributo no es un atributo.
 
> Nota: Junto a otras cosas, “@” miembros puede ser usado para añadir JSON-LD data a un documento JSON API. Estos documentos deberían ser entregados con [un encabezado extra](http://www.w3.org/TR/json-id/#interpreting-json-as-id) para transmitir a clientes JSON-LD que contengan JSON-LD data. 

## <a href="#fetching" id="fetching" class="headerlink"></a> Recuperación de Data 

Data, Incluidos recursos y relaciones, pueden ser recuperadas al enviar `GET` petición a un punto final. 
 
Respuestas pueden ser más refinadas con las características opcionales describidas abajo:


### <a href="#fetching-resources" id="fetching-resources" class="headerlink"></a> Consiguiendo recursos

Un servidor **DEBE** soportar conseguir datos de recursos por cada URL dada como un:
 
* Un enlace `self` como parte de un top-level objeto de enlace
* Un enlace `self` como parte de un resource-level objeto de enlace
* Un enlace `related` como parte de un relationship-level objeto de enlace
 
Por ejemplo, las siguientes solicitudes consiguen una colección de artículos:

```http
GET /articles HTTP/1.1
Accept: application/vnd.api+json
```

Las siguientes solicitudes consiguen un artículo:

```http
GET /articles/1 HTTP/1.1
Accept: application/vnd.api+json
```

Y la siguiente solicitud consigue el autor del artículo:

```http
GET /articles/1/author HTTP/1.1
Accept: application/vnd.api+json
```

#### <a href="#fetching-resources-responses" id="fetching-resources-responses" class="headerlink"></a> Respuestas

##### <a href="#fetching-resources-responses-200" id="fetching-resources-responses-200" class="headerlink"></a> 200 OK

Un servidor **DEBE** respinder a una petición exitosa para buscar un recurso individual o una colección de recursos con una respuesta `200 OK`.
 
Un servidor **DEBE** responder a una petición exitosa para buscar una colección de recursos con un arreglo de [recurso de objetos] o un arreglo vacío (`[]`) como los datos primarios de del documento de respuesta.
 
Por ejemplo, una petición  `GET` a una colección de artículos podría regresar: 

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
Una respuesta similar  representando una colección vacía sería:

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

Un servidor **MUST**  responder a una petición exitosa a un recurso individual con un  [resource object][resource objects] o `null` provisto como la respuesta a la información primaria del documento.
 
`null`  es solo una respuesta apropiada cuando la URL buscada es una que puede corresponder a un solo recurso, pero actualmente no.
 
> Nota: Considera,por ejemplo, una petición para buscar un a uno enlace de recurso relacionado. 
Esta petición respondería con `null` cuando la relación está vacía (tal que el enlace está correspondiendo a ningún recurso) pero con recursos únicos relacionados [resource object][resource objects] de otra manera.
 
Por ejemplo una petición  `GET` a un artículo individual puede regresar:
 
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

Si faltara el autor del autor del artículo anterior, entonces una petición  `GET` a ese recurso relacionado se devolverá.

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

##### <a href="#fetching-resources-responses-404" id="fetching-resources-responses-404" class="headerlink"></a> 404 No Encontrado

Un servidor **DEBE** responder con  `404 No Encontrado` cuando se está procesando una búsqueda a un solo recurso que no existe, excepto cuando la petición garantiza una respuesta   `200 OK` con`null` como la información primaria ( tal cual descrito anteriormente).

##### <a href="#fetching-resources-responses-other" id="fetching-resources-responses-other" class="headerlink"></a> Otras Respuestas

Un servidor  **PODRÍA** responder con otros códigos de estado HTTP.
 
Un servidor **PODRÍA** incluir [error details] con respuestas de error.
 
Un servidor **DEBE** preparar respuestas, y un cliente **DEBE** interpretar respuestas, en acordancia con
[`HTTP semantics`](http://tools.ietf.org/html/rfc7231).

### <a href="#fetching-relationships" id="fetching-relationships" class="headerlink"></a> Buscar Relaciones 

Un servidor **DEBE** soportar el buscador de relaciones de data para cada URL de relación proveído como una `self` link como parte de una relación objeto `link`. 

```http
GET /articles/1/relationships/comments HTTP/1.1
Accept: application/vnd.api+json
```

Por ejemplo, la siguiente petición busca data sobre comentarios de un artículo: 

```http
GET /articles/1/relationships/author HTTP/1.1
Accept: application/vnd.api+json
```

#### <a href="#fetching-relationships-responses" id="fetching-relationships-responses" class="headerlink"></a> Respuestas

##### <a href="#fetching-relationships-responses-200" id="fetching-relationships-responses-200" class="headerlink"></a> 200 OK

Un servidor **DEBE** responder a una petición exitosa para buscar una relación con una respuesta `200 OK`.
 
La data primaria en el documento de respuesta **DEBE** coincidir con el valor apropiado para [resource linkage], cómo está descrito antes en [relationship objects][relationship].
 
El nivel-top [link object][links] **PUEDEN** contener `self` y `related` links, cómo está descrito arriba para [relationship objects] [relationships].
 
Por ejemplo, una petición ‘GET’ a un URL desde to-one la relación del link puede volver: 

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

Si la relación arriba está vacía, una petición `GET` al mismo URL devolvería: 

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

Una solicitud `GET` a un URL desde un enlace de relación de to-many podria regresar:

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

Si la relación de arriba está vacía entonces una solicitud `GET` al mismo URL devolvería:

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

##### <a href="#fetching-relationships-responses-404" id="fetching-relationships-responses-404" class="headerlink"></a> 404 No Encontrado

El servidor **DEBE** devolver `404 Not Found` cuando procesa una petición para conseguir un recurso que no existe.

> Nota: Esto puede pasar cuando el recurso pariente de la relación no existe. Por ejemplo, cuando `/articles/1` no existe, solicitar el `/articles/1/relationships/tags` devuelve` 404 Not Found`.   
 
Si el enlace de la relación URL existe pero la relación está vacía, entonces`200 OK`**DEBE** ser devuelto, como está descrito arriba. 

##### <a href="#fetching-relationships-responses-other" id="fetching-relationships-responses-other" class="headerlink"></a> Otras Respuestas

Un servidor **PUEDE**  responder con otro  HTTP código de estado.
 
Un servidor **PUEDE**  incluir [error details] con respuestas de errores 
 
Un servidor **DEBE** preparar respuestas, y un cliente **DEBE** interpretar respuestas, de acuerdo con [`HTTP semantics`](http://tools.ietf.org/html/rfc7231).

### <a href="#fetching-includes" id="fetching-includes" class="headerlink"></a> Inclusión de los Recursos Relacionados

Un endpoint **PUEDE** regresar recursos relacionados a los datos primarios por defecto.
 
Un endpoint **PUEDE** también soportar solicitar un parámetro `include` para dejar que el cliente customize cuales recursos relacionados deben volver. 
 
Si un endpoint no soporta de parámetro `include`, eso **DEBE** responder con `400 Bad Request` a cualquier solicitud que la incluya.
 
Si un endpoint soporta el parámetro `include` y el cliente lo envía, el servidor **NO PUEDE** incluir algo no solicitado [resource objects] a la sección `included` del [compound document]. 
 
El valor del parámetro `include` **DEBE** ser una lista de secuencias de relaciones separado por coma (U+002C COMMA, ",") Una secuencia de relaciones es una lista de nombres [relationship][relationships] separado con puntos (U+002E FULL-STOP, ".") 
 
Si un servidor no es capaz de identificar una secuencia de relación o no soporta incluir de recursos de una secuencia, **DEBE** responder con ‘400 Bad request’
 
>Nota: Por ejemplo, una secuencia de las relaciones puede ser `comments.author`, donde `comments` es un relación enumerada bajo `articles` [resource object][resource objects], y `author` es una relación numerada bajo `comments` [resource object][resource objects]. 
 
Por ejemplo, Comentarios podrían ser  solicitados con un artículo:

```http
GET /articles/1?include=comments HTTP/1.1
Accept: application/vnd.api+json
```

En orden para pedir recursos relacionados con otros recursos, una secuencia separada por puntos, para cada nombre de relación  puede ser especificado:


```http
GET /articles/1?include=comments.author HTTP/1.1
Accept: application/vnd.api+json
```

>Nota: Porque [compound documents][compound document] requieren enlace completo (excepto cuando el enlace de relación es excluido por conjuntos de campos escasos), recursos intermedios en un camino multi-part deben ser devueltos con los nodos hoja. Por ejemplo, una respuesta a una petición para `comments.author` debería incluir `comments` más a el `author` de cada uno de esos `comments`.
  
>Nota: Un servidor podría exponer una relación profundamente anidada como
`comments.author` Como una relación directa con un alias como `comment-authors`. Esto le permite a un cliente a pedir `/articles/1?include=comment-authors` En vez de 
`/articles/1?include=comments.author`. Abstrayendo la relación anidada con un alias, el servidor aún puede dar completo enlace en documentos compuestos sin incluir potencialmente recursos intermedios no queridos.
 
Múltiples recursos relacionados pueden ser solicitados en una lista separada por comas:
 
```http
GET /articles/1?include=author,comments.author HTTP/1.1
Accept: application/vnd.api+json
```

Además, recursos relacionados pueden ser solicitados desde un endpoint de relación: 

```http
GET /articles/1/relationships/comments?include=comments.author HTTP/1.1
Accept: application/vnd.api+json
```

En este caso, los datos primarios serían una colección de [resource identifier objects][resource identifier object]  que representa enlace con los comentarios para un artículo, mientras el comentario y autor del comentario regresaría como datos incluídos  
 
>Nota: Esta sección aplica a cualquier endpoint que responde con datos primarios, independientemente del tipo de petición. Por ejemplo, un servidor puede soportar la inclusión de recursos relacionados seguidos por una solicitud `POST` para crear un recurso o relación.

### <a href="#fetching-filtering" id="fetching-filtering" class="headerlink"></a> Filtros

El parámetro de pregunta `filter`  es reservado para filtrar los datos. Filtros son vistas a las colecciones, y servidores y clientes **DEBERÍAN** utilizar esta llave para filtrar operaciones.
 
>Nota:JSON API es agnóstico sobre las estrategias que soporta el servidor. El parámetro de pregunta `filter` puede ser utilizado como la base para cualquier número de estrategias de filtrado.

## <a href="#query-parameters" id="query-parameters" class="headerlink"></a> Parámetros de Pregunta 

Parámetros de pregunta de implementación específica**DEBE** adherirse a las mismas limitaciones que[member names] con el requerimiento adicional que **DEBE** contener al menos un carácter que no sea a-z (U+0061 a U+007A). Es **RECOMENDABLE** que sea U+002D Guión-Menos, "-", U+005F Línea baja, "_", o usar una letra mayúscula
(p.ej. camelCasing).
 
Si un servidor encuentra un parámetro de pregunta que no siga el sistema de nombres convencional arriba, y el servidor no sabe cómo procesarlo como un parámetro de pregunta de esta especificación, **DEBE** responder con `400 Bad Request`.
 
> Nota: Esto es para preservar la habilidad de JSON API de hacer adiciones a parámetros de pregunta estándares sin contradecir a implementaciones ya existentes. -->
