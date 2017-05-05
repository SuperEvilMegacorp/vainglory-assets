# Joueurs 

Les objets du joueur contiennent des informations agrégées sur la vie de chaque joueur. En ce moment, les joueurs sont assez clairsemés, mais il est prévu d'ajouter des données beaucoup plus riches à mesure qu'elles sont disponibles.

## Obtenir Un Seul Joueur

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/players/<ID>" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

```java
//Il existe une variété de bibliothèques Java HTTP qui prennent en charge les paramètres d'URL
```

```python
```

```ruby
```

```javascript
```

```go
```

> La commande ci-dessus renvoie JSON structuré comme celle-ci:

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

Ce point final récupère un joueur spécifique.

<aside class="notice">
 Des changements sont à venir! - Les ressources du lecteur ne sont pas entièrement définies à ce stade, mais sont inclus afin que les utilisateurs puissent obtenir des informations de base (nom, etc.) Cet objet aura des données additionnelles ajoutées au cours des prochains mois et peut changer légèrement à mesure que les données se déplacent du `attribute.stats` objet à l'objet principal `attributes`.
</aside>





Requête HTTP
GET https://api.dc01.gamelockerapp.com/shards/na/players

Paramètre de requête
Description :
Filtre jusqu'à 6 noms de joueur 

### Requête HTTP

`GET https://api.dc01.gamelockerapp.com/shards/na/players/<ID>`


### Paramètre URL

Parameter | Description
--------- | -----------
ID | Récupération de l’ID d’un joueur


## Obtenir une collection de joueurs

Ce point final récupère une collection de jusqu'à 6 joueurs, filtrée par son nom. Les noms des joueurs sont spécifiques à chaque région. Si un joueur a changé de nom, il est possible qu'il y ait plusieurs ID pour un nom de joueur unique.

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/players?filter[playerNames]=player1,player2" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

```java
//Il existe une variété de bibliothèques Java HTTP qui prennent en charge les paramètres de requête.
```

```python
```

```ruby
```

```javascript
```

```go
```

### Requête HTTP

`GET https://api.dc01.gamelockerapp.com/shards/na/players`

### Paramètre de requête


Parameter | Default | Description
--------- | ------- | -----------
filter[playerNames] | none | Filtres par noms de joueurs. Usage: filter[playerNames]=player1,player2
