# Equipos (Disponible pronto!)
 
Objetos equipo contienen información agregada durante la existencia de cada equipo.
 
## Conseguir una colección de equipos 

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/teams?filter[teamNames]=team1" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

Este endpoint recoge una colección de hasta 6 equipos.

<aside class="warning">
Importante - Recursos de equipo aún no están disponibles en el API..
</aside>

### Petición HTTP

`GET https://api.dc01.gamelockerapp.com/teams`
 
### Parámetros de pregunta
 
Parámetro | Defecto | Descripción
--------- | ------- | -----------
filter[teamNames] | none | Flirta por nombre del equipo. Uso: filter[teamNames]=team1
filter[teamIds] | none | Filtra por id del equipo. Uso: filter[teamIds]=12345

<aside class="success">
Recuerda — un equipo autentificado es un equipo feliz!
</aside>

## Conseguir un Solo Equipo

```shell
curl "https://api.dc01.gamelockerapp.com/teams/<ID>" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

```python
```
> El comando arriba devuelve JSON estructurado de esta manera:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

Este endpoint devuelve un equipo específico.

### Petición HTTP

`GET https://api.dc01.gamelockerapp.com/teams/<ID>`
 
### Parámetros URL
 
Parámetro | Descripción
--------- | -----------
ID | El ID del equipo a recoger