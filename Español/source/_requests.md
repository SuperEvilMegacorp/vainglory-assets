# Haciendo solicitudes
 
## Negociación de contenido
 
Clientes utilizando el api deberían especificar que aceptan respuestas utilizando el formato
`application/vnd.api+json`, por conveniencia también aceptamos 
`application/json`
porque está por defecto en muchas librerías de cliente populares.
 
El servidor responderá con una cabecera `Content-Type` que imita el formato solicitado por el cliente.

## Regiones

> Para especificar las regiones, utiliza este código:

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

El Servicio de Datos de Juego de Vainglory actualmente soporta las siguientes regiones:

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

## GZIP
 
> Para especificar la cabecera Accept-Encoding, utiliza este código:

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

Clientes pueden especificar la cabecera `Accept-Encoding: gzip` y el servidor compresa respuestas
Respuestas serán devueltas con `Content-Encoding: gzip`.
 
Dada la grandeza de partidas, esto puede tener mejoras en rendimiento significantes.
 
## Paginación

Donde aplicable, el servidor permite peticiones de limitar el número de resultados via paginación. Para paginar los datos primarios, da información de paginación a la parte de preguntas de la petición utilizando el límite y parámetros offset.
Para conseguir items 2 hasta 10 tendrias que especificar un límite de 8 y un offset de 2:
Si no es especificada, el servidor en partidas pondrá por defecto `limit=5` y `offset=0`, y para jugadores/muestras `limit=50` y `offset=0`
 
<aside class="warning">
Importante - Actualmente el servidor no permite más de 50 objetos de datos primarios.
</aside>

## Sortear
 
>El ejemplo debajo devolverá los artículos más antiguos primero:
 
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

>Los ejemplos debajo devolverá los artículos más nuevos primero.

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
El orden de sorteo por defecto siempre es ascendiendo. Ascendiendo corresponde a el orden estándar para número de números y letras, es decir, A hasta Z, 0 a 9). Para datos y tiempos, ascendiendo significa que valores anteriores preceden valores posteriores es decir 1/1/2000 estará antes de 1/1/2001.
 
Todas las colecciones de recursos tienen una orden de sorteo que está por defecto. Además, algunos recursos dan la habilidad de sortear acordando a una o más criterios ("sort fields").
 
Si los campos de sorteo (sort fields) están prefixed con un símbolo de menos, el orden será cambiado a descendiente.

## JSON-P Callbacks

```shell
curl -g "https://api.dc01.gamelockerapp.com/status?callback=foo"
```

Puedes enviar un parámetro ?callback para cualquier llamada GET para tener los resultados envueltos en una función JSON. Esto es utilizado típicamente cuando navegadores quieren empotrar contenido en páginas web mediante pasarse problemas cross domain. La respuesta include la misma salida de datos que el API regular, más la información de la cabecera HTTP relevante. 


## Cross Origin Resource Sharing

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

El API soporta Cross Origin Resource Sharing (CORS) para peticiones AJAX de cualquier origen.
Puedes leer el CORS W3C Recommendation, o esta introducción del HTML 5 Security Guide.
 
Aquí hay una muestra de una petición enviada desde un navegador dándole a http://example.com: