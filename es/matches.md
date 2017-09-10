# Partidas
 
Archivos de partidas son creados cada vez que un jugador completa una sesión de juego. Cada partida contiene información de alto nivel sobre cada sesión de juego, incluyendo información como duración, modo de juego, y más. Cada partida tiene dos listas.
 
## Listas

```json
{
  "type": "roster",
  "id": "eca49808-d510-11e6-bf26-cec0c932ce01",
  "attributes": {
    "stats": {
      "acesEarned": 2,
      "gold": 32344,
      "etc..."
    }
  },
  "relationships": {
    "team": {
      "data": {
        "type": "team",
        "id": "753d464c-d511-11e6-bf26-cec0c932ce01"
      }
    },
    "participants": {
      "data": [
        {
          "type": "participant",
          "id": "eca49a7e-d510-11e6-bf26-cec0c932ce01"
        },
        "etc..."
      ]
    }
  }
}
```

Listas siguen las puntuaciones de cada grupo opuesto de participantes. Si los jugadores entraron en matchmaking como un equipo, la lista tendrá un equipo relacionado. Listas tienen muchos objetos participantes, uno por cada miembro de la lista. Objetos lista sólo tienen significado dentro del contexto de una partida y no deben ser expuestos como un recurso aparte.

## Participantes

```json
{
  "type": "participant",
  "id": "ea77c3a7-d44e-11e6-8f77-0242ac130004",
  "attributes": {
    "actor": "*Hero009*",
    "stats": {
      "assists": 4,
      "crystalMineCaptures": 1,
      "deaths": 2,
      "farm": 49.25,
      "etc..."
    }
  }
}
```
Objetos participante siguen a cada miembro de una lista. Participantes pueden ser jugadores anónimos, jugadores registrados, o bots. En el caso donde el participante es un jugador registrado, el participante tendrá una relación de un solo jugador. 
Objetos participante sólo tienen significado dentro del contexto de una partida y no deben ser expuestos como un recurso aparte.

{% method %}
## Consigue una colección de partidas

Este endpoint devuelve datos de partidas. Bulk scraping partidas está prohibido.

{% sample lang="shell" %}
```shell
curl -g "https://api.dc01.gamelockerapp.com/shards/na/matches?sort=createdAt&page[limit]=3&filter[createdAt-start]=2017-02-27T13:25:30Z&filter[playerNames]=<playerName>" \
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
import requests

url = "https://api.dc01.gamelockerapp.com/shards/na/matches"

header = {
    "Authorization": "<api-key>",
    "X-TITLE-ID": "semc-vainglory",
    "Accept": "application/vnd.api+json"
}

query = {
    "sort": "createdAt",
    "filter[playerNames]": "<playerName>",
    "filter[createdAt-start]": "2017-02-28T13:25:30Z",
    "page[limit]": "3"
}

r = requests.get(url, headers=header, params=query)
```
{% sample lang="ruby" %}
```ruby

```
{% sample lang="js" %}
```javascript

```
{% sample lang="go" %}
```go
q := req.URL.Query()
q.Add("sort", "createdAt")
q.Add("filter[playerNames]", "<playerName>")
q.Add("filter[createdAt-start]", "2017-02-27T13:25:30Z")
q.Add("page[limit]", "3")
req.URL.RawQuery = q.Encode()
res, _ := client.Do(req)
```
{% common %}
> El comando arriba devuelve JSON estructurado de la siguiente manera:

```json
{
  "data": [
    {
      "type": "match",
      "id": "02b90214-c64d-11e6-9f6b-062445d3d668",
      "attributes": {
        "createdAt": "2017-01-06T20:30:08Z",
        "duration": 1482195372,
        "gameMode": "casual",
        "patchVersion": "1.0.0",
        "region": "na",
        "stats": "acesEarned: 3, etc..."
      },
      "relationships": {
        "rosters": {
          "data": [{
            "type": "roster",
            "id": "ea77c2eb-d44e-11e6-8f77-0242ac130004"
          }, {
            "type": "roster",
            "id": "dc2c14b4-d50c-11e6-bf26-cec0c932ce01"
          }]
        }
      }
    }
  ]
}
```
{% endmethod %}

### Petición HTTP

`GET https://api.dc01.gamelockerapp.com/shards/na/matches`

### Parámetros de pregunta
 
Parámetro | Defecto | Descripción
--------- | ------- | -----------
page[offset] | 0 | Permite paginación sobre resultados
page[limit] | 50 | El defecto (y máximo) es 50.  Valores menores que 50 y mayores 2 son soportados.
sort | createdAt | Por defecto, partidas son ordenadas por creación de tiempo ascendente.
filter[createdAt-start] | 3hrs ago | Debe ocurrir antes del fin del tiempo Formato es iso8601  Uso: filter[createdAt-start]=2017-01-01T08:25:30Z
filter[createdAt-end] | Now | Preguntas buscan en las últimas tres horas. Formato es iso8601 es decir: filter[createdAt-end]=2017-01-01T13:25:30Z
filter[playerNames] | none | Filtra con el  nombre de jugadores. Uso: filter[playerNames]=player1,player2,...
filter[playerIds] | none | Filtra con el Id de jugadores. Uso: filter[playerIds]=playerId,playerId,...
filter[teamNames] | none | Filtra con nombre de equipos. Nombres de equipos son lo mismo que los tags de equipo dentro del juego. Uso: filter[teamNames]=TSM,team2,...
filter[gameMode] | none | filtra con modos de juego (gameMode). Uso: filter[gameMode]=casual,ranked,...

**Recuerda** — una partida autentificada es una partida feliz!

{% method %}
## Consigue una sola partida

Este endpoint recoge una partida especifica.

{% sample lang="shell" %}
```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/matches/<matchID>" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```
{% sample lang="java" %}
```java
//Hay una variedad de librerías Java HTTP que soportan parámetros URL
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
> El comando arriba devuelve JSON estructurado de la siguiente manera:
 
```json
{
  "data": {
    "type": "match",
    "id": "02b90214-c64d-11e6-9f6b-062445d3d668",
    "attributes": {
      "createdAt": "2017-01-06T20:30:08Z",
      "duration": 1482195372,
      "gameMode": "casual",
      "patchVersion": "1.0.0",
      "region": "na",
      "stats": "acesEarned: 3, etc..."
    },
    "relationships": {
      "rosters": {
        "data": [{
          "type": "roster",
          "id": "ea77c2eb-d44e-11e6-8f77-0242ac130004"
        }, {
          "type": "roster",
          "id": "dc2c14b4-d50c-11e6-bf26-cec0c932ce01"
        }]
      }
    }
  }
}
```
{% endmethod %}

### Petición HTTP
 
`GET https://api.dc01.gamelockerapp.com/shards/na/matches/<ID>`
 
### Parámetros URL
 
Parámetro | Descripción
--------- | -----------
ID | El ID de la partida a recoger