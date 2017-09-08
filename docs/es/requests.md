# Haciendo solicitudes
 
## Negociación de contenido
 
Clientes utilizando el api deberían especificar que aceptan respuestas utilizando el formato
`application/vnd.api+json`, por conveniencia también aceptamos 
`application/json`
porque está por defecto en muchas librerías de cliente populares.
 
El servidor responderá con una cabecera `Content-Type` que imita el formato solicitado por el cliente.

{% method %}
## Regiones

El Servicio de Datos de Juego de Vainglory actualmente soporta las siguientes regiones:

{% common %}
> Para especificar las regiones, utiliza este código:

{% sample lang="shell" %}
```shell
"...gamelockerapp.com/shards/<region>/..."
```
{% sample lang="java" %}
```java
"...gamelockerapp.com/shards/<region>/..."
```
{% sample lang="python" %}
```python
"...gamelockerapp.com/shards/<region>/..."
```
{% sample lang="ruby" %}
```ruby
"...gamelockerapp.com/shards/<region>/..."
```
{% sample lang="js" %}
```javascript
"...gamelockerapp.com/shards/<region>/..."
```
{% sample lang="go" %}
```go
"...gamelockerapp.com/shards/<region>/..."
```
{% endmethod %}

***Shards de regiones generales***

Para encontrar datos respecto a servidores live, por favor utiliza los siguientes shards.

* **América del Norte:** ```na```
* **Europa:** ```eu```
* **Suramérica:** ```sa```
* **Asia Este:** ```ea```
* **Asia Sureste (SEA):** ```sg```

***Shards de regiones de torneo***
 
Para encontrar datos respecto a eSports profesionales, los cuales solo pasan en clientes privados, utiliza los siguientes shards.
 
* **Torneos de América del Norte:** 
* **Torneos de Europa:** 
* **Torneos de Suramérica:** `
* **Torneos de Asia Este:** 
* **Torneos de Asia Sureste:** 
 
**Elegir una región específica es actualmente necesario**

{% method %}
## GZIP

Clientes pueden especificar la cabecera `Accept-Encoding: gzip` y el servidor compresa respuestas
Respuestas serán devueltas con `Content-Encoding: gzip`.
 
Dada la grandeza de partidas, esto puede tener mejoras en rendimiento significantes.

{% common %}
> Para especificar la cabecera Accept-Encoding, utiliza este código:

{% sample lang="shell" %}
```shell
-H "Accept-Encoding: gzip"
```
{% sample lang="java" %}
```java
conn.setRequestProperty("Accept-Encoding","gzip");

```
{% sample lang="python" %}
```python
header = {"Accept-Encoding":"gzip"}
```
{% sample lang="ruby" %}
```ruby
```
{% sample lang="js" %}
```javascript
```
{% sample lang="go" %}
```go
req.Header.Set("Accept-Encoding", "gzip")
```
{% endmethod %}
 
## Paginación

Donde aplicable, el servidor permite peticiones de limitar el número de resultados via paginación. Para paginar los datos primarios, da información de paginación a la parte de preguntas de la petición utilizando el límite y parámetros offset.
Para conseguir items 2 hasta 10 tendrias que especificar un límite de 8 y un offset de 2:
Si no es especificada, el servidor en partidas pondrá por defecto `limit=5` y `offset=0`, y para jugadores/muestras `limit=50` y `offset=0`
 
**Importante** - Actualmente el servidor no permite más de 50 objetos de datos primarios.

{% method %}
## Sortear

El orden de sorteo por defecto siempre es ascendiendo. Ascendiendo corresponde a el orden estándar para número de números y letras, es decir, A hasta Z, 0 a 9). Para datos y tiempos, ascendiendo significa que valores anteriores preceden valores posteriores es decir 1/1/2000 estará antes de 1/1/2001.
 
Todas las colecciones de recursos tienen una orden de sorteo que está por defecto. Además, algunos recursos dan la habilidad de sortear acordando a una o más criterios ("sort fields").
 
Si los campos de sorteo (sort fields) están prefixed con un símbolo de menos, el orden será cambiado a descendiente.

{% common %}
>El ejemplo debajo devolverá los artículos más antiguos primero:

{% sample lang="shell" %}
```shell
".../matches?sort=createdAt"
```
{% sample lang="java" %}
```java
".../matches?sort=createdAt"
```
{% sample lang="python" %}
```python
".../matches?sort=createdAt"
```
{% sample lang="ruby" %}
```ruby
".../matches?sort=createdAt"
```
{% sample lang="js" %}
```javascript
".../matches?sort=createdAt"
```
{% sample lang="go" %}
```go
".../matches?sort=createdAt"
```
{% common %}
>Los ejemplos debajo devolverá los artículos más nuevos primero.

{% sample lang="shell" %}
```shell
".../matches?sort=-createdAt"
```
{% sample lang="java" %}
```java
".../matches?sort=-createdAt"
```
{% sample lang="python" %}
```python
".../matches?sort=-createdAt"
```
{% sample lang="ruby" %}
```ruby
".../matches?sort=-createdAt"
```
{% sample lang="js" %}
```javascript
".../matches?sort=-createdAt"
```
{% sample lang="go" %}
```go
".../matches?sort=-createdAt"
```
{% endmethod %}

{% method %}
## JSON-P Callbacks

Puedes enviar un parámetro ?callback para cualquier llamada GET para tener los resultados envueltos en una función JSON. Esto es utilizado típicamente cuando navegadores quieren empotrar contenido en páginas web mediante pasarse problemas cross domain. La respuesta include la misma salida de datos que el API regular, más la información de la cabecera HTTP relevante. 

{% sample lang="shell" %}
```shell
curl -g "https://api.dc01.gamelockerapp.com/status?callback=foo"
```

{% endmethod %}

{% method %}
## Cross Origin Resource Sharing

El API soporta Cross Origin Resource Sharing (CORS) para peticiones AJAX de cualquier origen.
Puedes leer el CORS W3C Recommendation, o esta introducción del HTML 5 Security Guide.
 
Aquí hay una muestra de una petición enviada desde un navegador dándole a http://example.com:

{% sample lang="shell" %}

```shell
curl -i https://api.dc01.gamelockerapp.com/status -H "Origin: http://example.com"
  HTTP/1.1 200 OK
  ...
  Access-Control-Allow-Origin: *
  Access-Control-Expose-Headers: Content-Length
```
This is what the CORS preflight request looks like:

```shell
curl -i https://api.dc01.gamelockerapp.com/status -H "Origin: http://example.com" -X OPTIONS
  HTTP/1.1 200 OK
  ...
  Access-Control-Allow-Headers: Origin,X-Title-Id,Authorization
  Access-Control-Allow-Methods: GET,POST,OPTIONS
  Access-Control-Allow-Origin: *
  Access-Control-Max-Age: 86400
```
{% endmethod %}
