# Faire des demandes

## Négociation de contenu

Les clients qui utilisent l'api doivent spécifier qu'ils acceptent les réponses à l'aide du format `application/vnd.api+json`, pour plus de commodité, nous accepterons également l'`application/json` car elle est la valeur par défaut pour de nombreuses bibliothèques clientes populaires.

Le Serveur répond avec un en-tête `Content-Type` qui reflète le format demandé par le Client.

## Les Régions

> Pour spécifier les régions, utilisez ce code:

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

Le Vainglory Game Data Service prend en charge actuellement les régions suivantes:

***Serveurs De Région Général***

Pour trouver des données à propos de serveurs en ligne, où toute donnée est trouvée, veuillez utilisez les sserveurs suivant.

* **Amérique du Nord:** ```na```
* **Europe:** ```eu```
* **Amérique du Sud:** ```sa```
* **Asie de l'Est:** ```ea```
* **Asie du Sud-Est (SEA):** ```sg```

***Serveurs De Région De Tournois***

Pour trouver des données à propos des eSport Professionnel, qui prennent place sur le client privé seulement, veuillez utiliser les shards suivant.

* **Tournois d'Amérique du Nord:** ```tournament-na```
* **Tournois d'Europe:** ```tournament-eu```
* **Tournois d'Amérique du Sud:** ```tournament-sa```
* **Tournois d'Asie de l'Est:** ```tournament-ea```
* **Tournois d'Asie Sud-est:** ```tournament-sg```

**Le choix d'une région spécifique est actuellement requis**

## GZIP

> Pour spécifier l'en-tête Accept-Encoding, utilisez ce code:

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

Les clients peuvent spécifier l'en-tête `Accept-Encoding: gzip` et le serveur va compresser les réponses.
Les réponses seront renvoyées avec `Content-Encoding: gzip`.

Compte tenu de la taille des matches, cela peut avoir des avantages significatifs sur le plan de la performance.

## Pagination


Le cas échéant, le serveur autorise les demandes à limiter le nombre de résultats renvoyés via la pagination. Pour paginer les données primaires, il faut fournir des informations de pagination à la partie requête de la requête en utilisant les paramètres de limite et de décalage.

Pour récupérer les articles 2 à 10, vous devez spécifier une limite de 8 et un décalage de 2:

Si non spécifié, le serveur par défaut pour les correspondances to`limit=5` et `offset=0` et pour les joueurs/échantillons à `limit=50` et `offset=0`

<aside class="warning">
Important - Actuellement, le serveur n'autorise pas les réponses avec plus de 50 objets de données primaires
</aside>

## Tri

>l’exmple ci-dessous renverra le plus ancien article en premier :

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

>Ces exemples ci-dessous vont retourner les plus nouveaux articles en premier.

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

L'ordre de tri par défaut est toujours ascendant. L'ordre croissant correspond à l'ordre normal des nombres et des lettres, c'est-à-dire A à Z, 0 à 9). Pour des dates et des instants, l'augmentation signifie que les valeurs antérieures précèdent les dernières, par ex. 1/1/2000 sera en avance sur 1/1/2001.

Toutes les collections de ressources ont un ordre de tri par défaut. En outre, certaines ressources permettent de trier selon un ou plusieurs critères ("champs de tri").

Si les champs de tri sont précédés d'un signe moins, l'ordre sera décrémenté.

## JSON-P Rappels

```shell
curl -g "https://api.dc01.gamelockerapp.com/status?callback=foo"
```

Vous pouvez envoyer un paramètre de rappel à n'importe quel appel GET pour que les résultats soient enveloppés dans une fonction JSON. Cela est généralement utilisé lorsque les navigateurs souhaitent intégrer du contenu dans des pages Web en contournant les problèmes de domaine croisé. La réponse comprend la même sortie de données que l'API régulière, plus les informations d'en-tête HTTP pertinentes.


## Partage De Ressources Croisées

```shell
curl -i https://api.dc01.gamelockerapp.com/status -H "Origin: http://example.com"
  HTTP/1.1 200 OK
  ...
  Accès-Controle-Permet-Origine: *
  Accès-Controle-Expose-Titres: Content-Length
```
Ceci est comment la demande CORS doit avoir l'air:

```shell
curl -i https://api.dc01.gamelockerapp.com/status -H "Origin: http://example.com" -X OPTIONS
  HTTP/1.1 200 OK
  ...
  Accès-Controle-Permet-Titres: Origin,X-Title-Id,Authorization
  Accès-Controle-Permet-Méthodes: GET,POST,OPTIONS
  Accès-Controle-Permet-Origine: *
  Accès-Controle-Maximum-Age : 86400
```

L'API prend en charge le partage croisé des ressources d'origine (CORS) pour les demandes AJAX de toute origine. Vous pouvez lire la Recommandation CORS W3C, ou cette intro du Guide de sécurité HTML 5.

Voici un exemple de demande envoyée depuis un navigateur qui a frappé http://example.com:




 



