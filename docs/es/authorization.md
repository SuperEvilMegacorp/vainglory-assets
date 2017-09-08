{% method %}
# Enlaces (Disponibles pronto!)

## Consigue un enlace

Este endpoint comprueba que un objeto link existe para un código dado.

{% sample lang="shell" %}
```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/link/{id}" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```
{% endmethod %}
 
### Petición HTTP
 
`GET https://api.dc01.gamelockerapp.com/link`
 
### Parámetros de pregunta
 
Parámetro | Defecto | Descripción
--------- | ------- | ----------- 

{% method %}
# Pública un Enlace

Este punto final crea un objeto de PlayerLink si el código de verificación coincide con el proporcionado por el juego 

{% sample lang="shell" %}
```shell
curl -XPOST "https://api.dc01.gamelockerapp.com/shards/na/link/{player_id}" \
  -H "Authorization: Bearer <api-key>" \
  -H "Accept: application/vnd.api+json"
```
{% endmethod %}

### HTTP Request

`POST https://api.dc01.gamelockerapp.com/link/{player_id}`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
code      |         | The verification code

## PlayerLink

```json
{
  "attributes": {
      "playerId": "fb374a7b-78be-4fcc-83ed-6a532a8a6f55",
      "shardId": "na",
      "titleId": "semc-vainglory"
  },
  "id": "2454e5ac-0a69-4468-ad12-8616f066e817",
  "type": "playerLink"
}
```
