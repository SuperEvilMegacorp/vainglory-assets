# Jugadores
 
Objetos jugador contienen información agregada de cada jugador desde su creación. En este momento jugadores son bastante escasos, pero hay planes de añadir más datos cuando se vuelva posible.

{% method %}
## Conseguir un solo jugador

Este endpoint devuelve a un jugador específico.

**Vienen Cambios!** - Recursos jugador no están completamente definidos aún, pero son incluidos para que consumidores consigan información básica (nombre, etc.) Este objeto tendrá datos adicionales añadidos en los siguientes meses, y puede cambiar un poco cuando datos se mueven desde el objeto `attributes.stats` al objeto principal `attributes`.

{% sample lang="shell" %}
```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/players/<ID>" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```
{% sample lang="java" %}
```java
//Hay una variedad de librerías Java HTTP que soportan query-parameters.

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
"data": {
  "attributes": {
      "stats": {
          "lossStreak": 1,
          "winStreak": 0,
          "lifetimeGold": 10536.0
      },
      "name": "boombastic04"
  },
  "type": "player",
  "id": "6abb30de-7cb8-11e4-8bd3-06eb725f8a76"
}
}
```
{% endmethod %}

### Petición HTTP

`GET https://api.dc01.gamelockerapp.com/shards/na/players/<ID>`
 
### Parámetros URL 
 
Parámetro | Descripción
--------- | -----------
ID | La ID del jugador que se recoge

{% method %}
## Consigue Un Grupo De Jugadores
 
Este endpoint recoge un grupo de hasta 6 jugadores, filtrados por nombre. Nombres de jugador son específicos a cada región. Si un jugador ha cambiado de nombre es posible que haya varios ID para un solo nombre de jugador.

{% sample lang="shell" %}
```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/players?filter[playerNames]=player1,player2" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```
{% sample lang="java" %}
```java
//Hay una variedad de librerías Java HTTP que soportan query-parameters.

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
{% endmethod %}

### Solicitud HTTP
 
`GET https://api.dc01.gamelockerapp.com/shards/na/players`

### Query Parameters

Parámetro | Por Defecto | Descripción
--------- | ------- | -----------
filter[playerNames] | ninguno | Filtros por nombre de jugador. Uso: filter[playerNames]=player1,player2