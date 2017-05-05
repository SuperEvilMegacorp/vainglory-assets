# Equipes (à venir bientôt!)

Les objets d'équipe contiennent des informations agrégées à vie sur chaque équipe.

## Obtenez Une Collection d'équipes

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/teams?filter[teamNames]=team1" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

Ce point final récupère toutes les équipes.

<aside class="warning">
Important: les ressources d'équipe ne sont pas encore disponibles dans l'API.
</aside>

### Requête HTTP

`GET https://api.dc01.gamelockerapp.com/teams`

### Paramètres de requête

Paramètre | Par défaut | Description
--------- | ------- | -----------
filter[teamNames] | none | Filtres par nom d'équipe. Usage: filter[teamNames]=team1
filter[teamIds] | none | Filtrer par identifiant de l'équipe. Usage: filter[teamIds]=12345

<aside class="success">
Rappelez-vous: une équipe heureuse est une équipe authentifiée !
</aside>

## Obtenir une seul équipe 

```shell
curl "https://api.dc01.gamelockerapp.com/teams/<ID>" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

```python
```

> La commande ci-dessus renvoie JSON structurée comme ceci:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

Ce point final récupère une équipe spécifique.

### Requête HTTP

`GET https://api.dc01.gamelockerapp.com/teams/<ID>`

### Paramètres URL

Paramètre | Description
--------- | -----------
ID | L'ID de l'équipe à récupérer
