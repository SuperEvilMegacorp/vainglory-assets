# Échantillons

Le point final des échantillons fournit un moyen simple d'accéder à des lots horaires de données de correspondance aléatoire pour agréger les statistiques.

## Obtenir Une Collection d’echantillons 

```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/samples" \
  -H "Authorization: Bearer <api-key>" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```
```java
//Il existe une variété de bibliothèques Java HTTP qui prennent en charge les paramètres de requête
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

Ce point final récupère une collection de matches sélectionnés au hasard.

### Requête HTTP

`GET https://api.dc01.gamelockerapp.com/shards/na/samples`

### Paramètre de requête

Parameter | Default | Description |
--------- | ------- | -----------   
page[offset] | 0 | Permet la pagination sur les résultats.
page[limit] | 50 | La valeur par défaut (et le maximum actuel) est de 50. Les valeurs inférieures à 50 et supérieures à 2 sont prises en charge.
sort | createdAt | Par défaut, les échantillons sont triés par temps de création ascendant.
filter[createdAt-Start] | none | Doit se produire avant l'heure. Le format est iso8601 Utilisation: filter[createdAt-end]=2017-01-01T08:25:30Z.
filter[createdAt-End] | none | Doit se produire après un certain temps. Le format est iso8601 Utilisation: filtre[createdAt-end]=2017-01-01T13:25:30Z