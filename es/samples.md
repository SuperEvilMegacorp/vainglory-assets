# Muestras

El endpoint de ejemplos da una manera fácil de acceder lotes de datos aleatorios de partidas cada hora para agregar estadísticas.

{% method %}
## Conseguir una colección de muestras

Este endpoint recoge una colección de partidas seleccionadas aleatoriamente. 

{% sample lang="shell" %}
```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/samples" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```
{% sample lang="java" %}
```java
//Hay una variedad de librerías Java HTTP que soportan parámetros de pregunta.
```
{% sample lang="python" %}
```python

```
{% sample lang="ruby" %}
```ruby

```
{% sample lang="js" %}
```javascript

```
{% sample lang="go" %}
```go

```
{% common %}
> El comando arriba devuelve JSON estructurado de esta manera:

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
{% endmethod %}

### Petición HTTP

`GET https://api.dc01.gamelockerapp.com/shards/na/samples`
 
### Parámetros de pregunta
 
Parámetro | Defecto | Descripción |
--------- | ------- | -----------   
page[offset] | 0 | Permite paginación sobre resultados 
page[limit] | 50 | El defecto (y el máximo) es 50. Valores menores que 50 y mayores 2 son soportados.
sort | createdAt | Por defecto, muestras son sorteados por tiempo de creación ascendiente. 
filter[createdAt-Start] | none | Debe ocurrir antes del tiempo. El formato es iso8601 Uso: filter[createdAt-end]=2017-01-01T08:25:30Z
filter[createdAt-End] | none | Debe ocurrir antes del tiempo. El formato es iso8601 Uso: filter[createdAt-end]=2017-01-01T13:25:30Z