# Liens (à venir bientôt!)

## Obtenir un lien

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/link/{id}" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

Ce point final vérifie si un objet de lien existe pour un code donné.

### Requête HTTP

`GET https://api.dc01.gamelockerapp.com/link`

### Paramètres de requête

Paramètre | Par défaut | Description
--------- | ------- | ----------- 
