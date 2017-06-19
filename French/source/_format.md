# <a href="#document-resource-objects" id="document-resource-objects" class="headerlink"></a> Objets De Ressource

Les “Objets de ressources” apparaissent dans un document de l'API JSON pour représenter les ressources.

Un objet ressource **DOIT** contenir au moins les membres de niveau supérieur suivants:

* `id`
* `type`

Exception: le membre `id` n'est pas requis lorsque l'objet ressource est originaire du client et représente une nouvelle ressource à créer sur le serveur.

En outre, un objet ressource **PEUT** contenir un de ces membres de niveau supérieur:

* `Attributes`: un [objet attribut] [attributes] représentant certaines des données de la ressource.
* `Relations`: un [objet relationnel] [relationships] décrivant les relations entre
La ressource et autres ressources JASON API
*`Links`: un [objet liens] [links] contenant des liens liés à la ressource.

Voici comment un article (c'est-à-dire une ressource de type "articles") pourrait apparaître dans un document:

```json
// ...
{
  "type": "articles",
  "id": "1",
  "attributes": {
    "title": "Rails is Omakase"
  },
  "relationships": {
    "author": {
      "links": {
        "self": "/articles/1/relationships/author",
        "related": "/articles/1/author"
      },
      "data": { "type": "people", "id": "9" }
    }
  }
}
// ...
```

#### <a href="#document-resource-object-identification" id="document-resource-object-identification" class="headerlink"></a> Identification

Chaque [objet de ressource] [resource objects] **DOIT** contenir un membre `id` et un membre` type`.
Les valeurs des membres `id` et` type` **DOIVENT** être des chaînes.

Dans une API donnée, la paire `type` et `id` de chaque objet ressource **DOIT**
Identifiez une ressource unique. (L'ensemble des URI contrôlés par un serveur, ou plusieurs serveurs agissant comme un seul, constituent un API.)

Le membre `type` est utilisé pour décrire [resource objects] qui partagent en commun les attributs et les relations.

Les valeurs des membres `type` **DOIVENT** respecter les mêmes contraintes que
[Nom de membre].

> Remarque: Cette spécification est agnostique au sujet des règles d'inflexion, donc la valeur de `type`
Peut être pluriel ou singulier. Cependant, la même valeur devrait être utilisée
De manière constante tout au long de la mise en œuvre.

#### <a href="#document-resource-object-fields" id="document-resource-object-fields" class="headerlink"></a> Champs

Les [attributs] et les [relations] de l'objet ressource sont collectivement appelés
ces "[fields]".

Les champs pour un [objet ressource] [resource objects] **DOIVENT** partager un espace de noms commun avec chacun
Autres et avec `type` et `id`. En d'autres termes, une ressource ne peut pas avoir
une attribution et relation avec le le même nom, et ne peut pas non plus avoir un attribut ou une relation nommé `type` ou `id`.

#### <a href="#document-resource-object-attributes" id="document-resource-object-attributes" class="headerlink"></a> Les Attributs

La valeur de la touche `attributes` **DOIT** être un objet (un "attributs objet"). Les membres de l'objet attributs (" attributs ") représentent des informations
À propos de [objet ressource] [resource objects] dans lequel il sont défini

Les attributs peuvent contenir n’importe quelle valeur JSON valide.

Des structures de données complexes impliquant des objets JSON et des tableaux sont autorisées comme valeurs d'attribut. Toutefois, tout objet qui constitue ou est contenu dans un attribut **NE DOIT PAS** contenir un membre `relationships` ou `links`, Étant donné que ces membres sont réservés par cette spécification pour une utilisation future.
  

Bien que has-one #fix des clés étrangères (par exemple, `author_id`) sont souvent stockées en interne
Aux côtés d'autres informations à représenter dans un objet ressource, ces clés
**NE DOIT PAS** apparaître comme des attributs.

> Remarque: voir [champs] et [noms des membres] pour plus de restrictions sur ce conteneur.

#### <a href="#document-resource-object-relationships" id="document-resource-object-relationships" class="headerlink"></a> Relations

La valeur de la clé `relationships` **DOIT** être un objet (un "objet de relations
"). Les membres de l'objet relation ("relationships") représentent
Des références à partir du [objet ressource][resource objects] dans lesquels il est défini à d’autre objets ressource
.

Les relations peuvent être à-un ou à-beaucoup.

Un “objet relationnel” **DOIT** contenir au moins l'un des éléments suivants:

* `links`: un [objet de lien] [links] contenant au moins l'un des éléments suivants:
* `self`: un lien pour la relation elle-même (un "lien de relation"). Ce
    Lien permet au client de manipuler directement la relation. Par exemple,
Supprimer un ‘author’ par l'URL de relation ‘article’ déconnecterait
La personne de l’ `article` sans supprimer la ressource `people` elle-même.
   Lorsqu'il est acheminé avec succès, ce lien renvoie [lien] [resource linkage]
Pour les ressources associées en tant que données principales.
(Voir [Récupération des relations](# fetching-relations).)
* `related`: un [lien de ressource connexe]
* `data`: [lien de ressource]
* `meta`: un [Meta objet] [meta] qui contient des méta-informations non standard sur la
relation.

> Remarque: voir [champs] et [noms des membres] pour plus de restrictions sur ce conteneur.

#### <a href="#document-resource-object-related-resource-links" id="document-resource-object-related-resource-links" class="headerlink"></a> Liens de Ressources Connexes

Un “lien de ressource connexe” permet d'accéder à [objets de ressource] [resource objects] [liés] [links]
 
Dans une [relation] [relationships]. Lorsque récupérés, les objets ressource liés sont retournés comme les données principales de la réponse.
 
Par exemple, Les `comments` d’un `article` [relation] [relationships] pourrait spécifiez un [lien] [links] qui renvoie une collection de commentaires [objets de ressource] lorsqu'il est récupéré via une requête `GET`.

Si présent, un lien de ressource connexe **DOIT** faire référence à une URL valide, même si
La relation n'est actuellement associée à aucune ressource cible. De plus,
Un lien de ressource connexe **NE DOIT PAS** changer parce que le contenu de sa relation
change.

#### <a href="#document-resource-object-linkage" id="document-resource-object-linkage" class="headerlink"></a> Lien De Ressource

Le lien de ressource dans un [compound document] permet à un client de lier ensemble
tout les [objets de ressource] inclus sans avoir à `GET` toutes les URL via [links].

Le lien de ressource **DOIT** être représenté comme l'un des éléments suivants:

* `null` pour les relations vide-à-un.

* Un tableau vide (`[]`) des relations à plusieurs.
* Un seul [objet identificateur de ressource] pour les relations non-vides à un. 
* Un tableau de [objet identificateur de ressource] [resource identifier object] pour des relations non-vides à plusieurs.
 
> Remarque: La spécification ne donne pas de sens à l'ordre d'identifiant de ressource d'objets dans des tableaux de liaison de plusieurs relations, bien que les implémentations peuvent le faire. Les tableaux d'objets d'identifiant de ressource peuvent représenter des relations ordonnés et des non ordonnées, et les deux types peuvent être mélangés en un seul objet de réponse.
 
Par exemple, l’article ci dessous est associé avec un `auteur` : 

```json
// ...
{
  "type": "articles",
  "id": "1",
  "attributes": {
    "title": "Rails is Omakase"
  },
  "relationships": {
    "author": {
      "links": {
        "self": "http://example.com/articles/1/relationships/author",
        "related": "http://example.com/articles/1/author"
      },
      "data": { "type": "people", "id": "9" }
    }
  },
  "links": {
    "self": "http://example.com/articles/1"
  }
}
// ...
```

La relation `auteur` comprend un lien pour la relation elle-même (qui permet au client de modifier l'auteur concerné directement), un lien ressource connexe pour récupérer les objets de ressource et les informations de liaison

#### <a href="#document-resource-object-links" id="document-resource-object-links" class="headerlink"></a> Liens De Ressources

Les `liens` facultatif du membre dans chaque [resource object][resource objects] contient [links] relatifs à la ressource.

Si présent, ces liens d'objets **PEUVENT** contenir un `propre` [links][links] qui identifient les ressources représentées par les objets des ressources.

```json
// ...
{
  "type": "articles",
  "id": "1",
  "attributes": {
    "title": "Rails is Omakase"
  },
  "links": {
    "self": "http://example.com/articles/1"
  }
}
// ...
```

Un serveur **DOIT** répondre à une requête `GET` reçue à un URL avec une réponse qui inclut la ressource comme donnée primaire.

### <a href="#document-resource-identifier-objects" id="document-resource-identifier-objects" class="headerlink"></a> Objets Identifiants De Ressources

Un "objet identifiant de ressources" est un objet qui identifie une ressource individuelle.

Un "objet identifiant de ressources" **DOIT** contenir les `type` et `id` des membres.

Un "objet identifiant de ressources" **PEUT** aussi contenir un membre `méta`, cette valeur est un  objet [méta] qui contient des méta-informations non-standards.

### <a href="#document-compound-documents" id="document-compound-documents" class="headerlink"></a> Composé De Documents

Pour réduire le nombre de requêtes HTTP, les serveurs **PEUVENT** permettre des réponses qui incluent des ressources qui peuvent se rapporter, ainsi que les principales ressources demandées. Ces réponses sont appelés "documents composites".

Dans un document composé, tous les ressources inclus **DOIVENT** être représentés comme un tableau des [objets de ressource] à un membre de niveau supérieur `inclus`.

Les documents composites exigent "couplage complet", ce qui signifie que chaque ressources inclus **DOIT** être identifié par au moins un [objet identificateur de ressource] dans le même document. Ces objets d’identificateur de ressource peuvent être , des donnés principaux, ou représente lien ressources contenue dans le principal ou ressources incluses.

La seule exception à l’exigence de lien complet est quand un champs relation qui dans le cas contraire contiendrait un lien de donné qui sont exclues via [ensembles clairsemés de terrain](#fetching-sparse-fieldsets).

> À Noter : Le lien complet assure que les ressources incluses sont liés soit, dans les données principales (qui pourrait être [objets de ressource] ou [identificateur de ressource objets][objet identificateur de ressource]) ou à l’autre.

Un document d’exemple complet avec plusieurs relations inclus : 

```json
{
  "data": [{
    "type": "articles",
    "id": "1",
    "attributes": {
      "title": "JSON API paints my bikeshed!"
    },
    "links": {
      "self": "http://example.com/articles/1"
    },
    "relationships": {
      "author": {
        "links": {
          "self": "http://example.com/articles/1/relationships/author",
          "related": "http://example.com/articles/1/author"
        },
        "data": { "type": "people", "id": "9" }
      },
      "comments": {
        "links": {
          "self": "http://example.com/articles/1/relationships/comments",
          "related": "http://example.com/articles/1/comments"
        },
        "data": [
          { "type": "comments", "id": "5" },
          { "type": "comments", "id": "12" }
        ]
      }
    }
  }],
  "included": [{
    "type": "people",
    "id": "9",
    "attributes": {
      "first-name": "Dan",
      "last-name": "Gebhardt",
      "twitter": "dgeb"
    },
    "links": {
      "self": "http://example.com/people/9"
    }
  }, {
    "type": "comments",
    "id": "5",
    "attributes": {
      "body": "First!"
    },
    "relationships": {
      "author": {
        "data": { "type": "people", "id": "2" }
      }
    },
    "links": {
      "self": "http://example.com/comments/5"
    }
  }, {
    "type": "comments",
    "id": "12",
    "attributes": {
      "body": "I like XML better"
    },
    "relationships": {
      "author": {
        "data": { "type": "people", "id": "9" }
      }
    },
    "links": {
      "self": "http://example.com/comments/12"
    }
  }]
}
```

Un [document composé] **NE DOIT PAS**  inclure plus d’un [objet ressource][resource objects] pour chaque paire de `type` et `id`.

> À Noter : En un seul document, vous pouvez penser le `type` et `id` comme une clé composite qui référence uniquement [objets de ressource] dans une autre partie du
le document.

> À Noter: Cette approche garantit qu’un seul canonique [objet ressource][resource objects] est
retourné avec chaque réponse, même si la même ressource est référencée
plusieurs fois.

### <a href="#document-meta" id="document-meta" class="headerlink"></a> Meta-information

Où spécifié, un membre `meta` peut être utilisé pour inclure une information-meta atypique. La valeur de chaque membre `meta` **DOIT** être un objet (a "Objet de meta”).

Chaque membre **PEUT** être spécifié avec un objet `meta`.
 
Par exemple:

```json
{
  "meta": {
    "copyright": "Copyright 2015 Example Corp.",
    "authors": [
      "Yehuda Katz",
      "Steve Klabnik",
      "Dan Gebhardt",
      "Tyler Kellen"
    ]
  },
  "data": {
    // ...
  }
}
```

### <a href="#document-links" id="document-links" class="headerlink"></a> Liens

Où spécifié, un membre `links` peut être utilisé pour représenter les liens. La valeur de chaque membre `links` **DOIT** être un objet (a "Objet de lien")

Chaque membre d'un objet de lien est un "lien". Un lien **DOIT** être représenté comme tel:  

* une chaîne qui contient l'URL du lien.
* un objet ("Objet de lien") qui peut contenir les membres suivants:
 * `href`: une chaîne contenant l'URL du lien.
 * `meta`: Un objet méta contenant des méta-informations at atypique à propos du lien.

Le lien `self` suivant est juste une URL:

```json
"links": {
  "self": "http://example.com/posts"
}
```

Le lien `related` suivant inclut une URL aussi bien qu'une méta-information à propos d'une collection de ressource apparenté. 

```json
"links": {
  "related": {
    "href": "http://example.com/articles/1/comments",
    "meta": {
      "count": 10
    }
  }
}
```

> À noter: Des membres supplémentaires peuvent être spécifiés pour les objets de liens 
 à l'avenir. C'est aussi possible que les valeurs autorisés des membres additionnels vont être expansés (e.g. a `collection` link may support an
array of values, whereas a `self` link does not).

### <a href="#document-jsonapi-object" id="document-jsonapi-object" class="headerlink"></a> Objet de l'API JSON

Un document JSON API **PEUT** inclure des informations à propos de sa mise en oeuvre en dessous d'un membre haut niveau `jsonapi`. Si présent, la valeur du membre `jsonapi` **DOIT** être un objet (a "objet jsonapi").L’objet json api **DEVRAIT** contenir un membre `version` dont la valeur est une chaîne indiquant la plus haute version JSONAPI supportée. Cet objet **DEVRAIT** aussi contenir un membre `meta`, dont la valeur est un objet de [meta] qui contient une information-meta atypique.

```json
{
  "jsonapi": {
    "version": "1.0"
  }
}
```

Si le membre `version` n'est pas présent, les clients devraient considérer les outils du serveur, au moins la version 1.0 de la spécification. 

> À noter: Parceque JSON API est investi pour faire des changements supplémentaires uniquement, la chaîne de version indique principalement quelles nouveautés un serveur peut supporter.

### <a href="#document-member-names" id="document-member-names" class="headerlink"></a> Noms De Membres

Tous les noms de membres utilisés dans un document API JSON **DOIVENT** être traités comme un cas sensible par les clients et les serveurs, et ils **DOIVENT** rencontrer toutes les conditions suivantes: 

- Les noms des membres **DOIVENT** contenir au moins un caractère.
- Les noms des membres **DOIVENT** contenir uniquement  les caractères autorisés, listés ci-dessous.
- Les noms des membres **DOIVENT** commencer et terminer par un "caractère globalement autorisé", comme définit en dessous.

Pour permettre une configuration des noms des membres en URLs, il est **RECOMMANDÉ** que les noms de membres utilisés soient uniquement des URLs non réservés, les URLs doivent avoir des caractères sûr, spécifiés dans [RFC 3986](http://tools.ietf.org/html/rfc3986#page-13).

#### <a href="#document-member-names-allowed-characters" id="document-member-names-allowed-characters" class="headerlink"></a> Allowed Characters

Les "caractères globalement autorisés" suivants **PEUVENT** être utilisés n'importe où dans un nom de membre:

- U+0061 jusqu’à U+007A, "a-z"
- U+0041 jusqu’à U+005A, "A-Z"
- U+0030 jusqu’à U+0039, "0-9"
- U+0080 and above (non-ASCII Unicode characters; _not recommended, not URL safe_)

De plus, les caractères suivant sont autorisés dans les noms de membres, sauf en tant que premier ou dernier caractère:

- U+002D TIRET-MOINS, "-"
- U+005F LIGNE BASSE, "_"
- U+0020 ESPACE, " " _(not recommended, not URL safe)_
 
#### <a href="#document-member-names-reserved-characters" id="document-member-names-reserved-characters" class="headerlink"></a> Reserved Characters

Les caractères suivants **NE DOIVENT PAS** être utilisés dans les noms de membres:

-U+002B SIGNE PLUS, "+" _(used for ordering)_
- U+002C VIRGULE, "," _(used as a separator between relationship paths)_
- U+002E POINT, "." _(used as a separator between relationship paths)_
- U+005B CROCHET GAUCHE, "[" _(used in sparse fieldsets)_
- U+005B CROCHET DROITE, "]" _(used in sparse fieldsets)_
- U+0021 POINT D'EXCLAMATION, "!"
- U+0022 OUTIL DE CITATION, '"'
- U+0023 SIGNE DE NOMBRE, "#"
- U+0024 SIGNE DOLLAR, "$"
- U+0025 SIGNE POURCENTAGE, "%"
- U+0026 ESPERLUETTE, "&"
- U+0027 APOSTROPHE, "'"
- U+0028 PARENTHESE DE GAUCHE, "("
- U+0029 PARENTHESE DE DROITE, ")"
- U+002A ASTÉRISQUE , "&#x2a;"
- U+002F SLASH, "/"
- U+003A DEUX-POINTS, ":"
- U+003B POINT-VIRGULE, ";"
- U+003C SIGNE INFERIEUR , "<"
- U+003D SIGNE EGUALE, "="
- U+003E SIGNE SUPERIEUR, ">"
- U+003F POINT D'INTERROGATION, "?"
- U+0040 AROBASE, "@"
- U+005C SLASH INVERSÉ, "\"
- U+005E ACCENT CIRCONFLEXE, "^"
- U+0060 ACCENT GRAVE, "&#x60;"
- U+007B ACCOLADE GAUCHE, "{"
- U+007C LIGNE VERTICALE, "|"
- U+007D ACCOLADE DROITE, "}"
- U+007E TILDE, "~"
- U+007F SUPPRIMER
- U+0000 jusqu’à U+001F (C0 Controlls)

#### <a href="#document-member-names-at-members" id="document-member-names-at-members" class="headerlink"></a> @-Membres

Les noms des membres **PEUVENT** aussi débuter avec un signe (U+0040 COMMERCIAL AT, "@"). Les membres appellent cette méthode "@-Membres" . @-Membres **PEUVENT** apparaître n'importe où dans un document JSON API.

Toutefois,  les JSON API processeurs **DOIVENT** complètement ignorer @-Membres (i.e ne pas les traiter comme les données d'un JSON API ).

En plus, l'existence d'un @-Membres **DOIT** être ignoré quand toutes les définitions d'un JSON API sont traités et Lors de l'interprétation de toutes les définitions de l'API JSON et les instructions de traitement données en dehors de cette
Paragraphe. Par exemple un [attribut][attributes] est défini au dessus comme n’importe membre de l'objet attributs. Cependant, parce que les @-Membres doivent être ignoré Lors de l'interprétation de cette définition, un @-Membre qui se produit dans un objet attribut
n'est pas un attribut.

> A Noter : Entre autres choses, “@“  membres peuvent être utilisés pour ajouter des données JSON-LD pour un document de l’API JSON. Ces documents doivent être servis avec [un en-tête supplémentaire](http://www.w3.org/TR/json-ld/#interpreting-json-as-json-ld)
de transmettre aux clients de JSON-LD qu’ils contiennent des données JSON-LD.

## <a href="#fetching" id="fetching" class="headerlink"></a> Fetching Data

Extraction de données, y compris les ressources et les relations peuvent être cherchées en envoyant un `GET` demande à un point de terminaison.

Les réponses peuvent être encore affinée avec les caractéristiques facultatives décrites ci-dessous.

### <a href="#fetching-resources" id="fetching-resources" class="headerlink"></a> Extraction De Ressources

Un serveur **DOIT** supporter l'extraction de données de ressources pour chaque URL fournie comme :

* un lien `soi` dans le cadre de l’objet de niveau supérieur des liens
* un lien `soi`dans le cadre d’un objet au niveau des ressources des liens
* un lien `lien` dans le cadre d’un objet relation niveau des liens

Par exemple, la requête suivante récupère une collection d’articles :

```http
GET /articles HTTP/1.1
Accept: application/vnd.api+json
```

La requête suivante récupère un article :

```http
GET /articles/1 HTTP/1.1
Accept: application/vnd.api+json
```

Et la requête suivante récupère les auteur de l’article :

```http
GET /articles/1/author HTTP/1.1
Accept: application/vnd.api+json
```

#### <a href="#fetching-resources-responses" id="fetching-resources-responses" class="headerlink"></a> Réponses

##### <a href="#fetching-resources-responses-200" id="fetching-resources-responses-200" class="headerlink"></a> 200 OK

Un serveur ** DOIT** répondre à une demande réussie pour aller chercher une personne
ressource ou collection de ressources avec un `200 OK` "réponse. 

Un serveur ** DOIT ** répondre à une demande réussie pour aller chercher une ressource
collection avec un tableau de [objets de ressource] ou un tableau vide (`[]`) comme
données principales du document réponse. 

Par exemple, une demande de `GET` pour une collection d’articles pourrait retourner :

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "http://example.com/articles"
  },
  "data": [{
    "type": "articles",
    "id": "1",
    "attributes": {
      "title": "JSON API paints my bikeshed!"
    }
  }, {
    "type": "articles",
    "id": "2",
    "attributes": {
      "title": "Rails is Omakase"
    }
  }]
}
```

Une réponse similaire, ce qui représente une collection vide serait :

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "http://example.com/articles"
  },
  "data": []
}
```
Un serveur ** DOIT ** répondre à une demande réussie pour aller chercher une personne
ressource avec un [objet de ressource] [objets de ressource] ou `null` fourni dans les données principaux du document réponse. 

`null` est seulement une réponse appropriée lorsque l’URL demandée est l’une qui pourrait correspondre à une seule ressource, mais ne fonctionne pas actuellement.
 
> À Noter : Prenons, par exemple, une demande pour aller chercher un lien à un sur les ressources. Cette demande répondrait avec `null` lorsque la relation est vide (tels que le lien est correspondant à aucune ressource) mais avec de la ressource connexe [objet ressource] [resource objects] dans le cas contraire. 

Par exemple, une demande de `GET` pour un article pourrait retourner :

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "http://example.com/articles/1"
  },
  "data": {
    "type": "articles",
    "id": "1",
    "attributes": {
      "title": "JSON API paints my bikeshed!"
    },
    "relationships": {
      "author": {
        "links": {
          "related": "http://example.com/articles/1/author"
        }
      }
    }
  }
}
```

Si les relations de l’article ci-dessus est manquant, une requête `AVOIR` à cette ressource liée renvoie donc :

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "http://example.com/articles/1/author"
  },
  "data": null
}
```

##### <a href="#fetching-resources-responses-404" id="fetching-resources-responses-404" class="headerlink"></a> 404 Non Trouvé

Un serveur **DOIT** répondre avec '404 Not Found` lors du traitement d’une demande de extraire une ressource unique qui n’existe pas, sauf si la demande justifie une réponse `200 OK` avec `null` comme les données primaires (comme décrit ci-dessus). 

##### <a href="#fetching-resources-responses-other" id="fetching-resources-responses-other" class="headerlink"></a> Autres Réponses

Un serveur **PEUT** répondre avec d’autres codes d’état HTTP.

Un serveur **PEUT** inclure [détails de l’erreur] avec les réponses d’erreur. 

Un serveur **DOIT** préparer des réponses, et un client **DOIT ** interpréter les réponses, conformément avec
[`Sémantique HTTP`](http://tools.ietf.org/html/rfc7231). 

### <a href="#fetching-relationships" id="fetching-relationships" class="headerlink"></a> Extraction De Relations

Un serveur **DOIT** supporter l’extraction de données de rapport pour chaque URL de relation fourni sous forme de lien `soi` comme partie d’une relation d’un objet `liens`. 

Par exemple, la requête suivante extrait les données sur les commentaires d’un article :

```http
GET /articles/1/relationships/comments HTTP/1.1
Accept: application/vnd.api+json
```

Et la requête suivante extrait les données sur l’auteur de l’article :

```http
GET /articles/1/relationships/author HTTP/1.1
Accept: application/vnd.api+json
```

#### <a href="#fetching-relationships-responses" id="fetching-relationships-responses" class="headerlink"></a> Réponses

##### <a href="#fetching-relationships-responses-200" id="fetching-relationships-responses-200" class="headerlink"></a> 200 OK

Un serveur **DOIT** répondre à une demande réussie pour aller chercher une relation
avec un `200 OK` réponse.

Les données primaires dans le document de réponse **DOIT** correspondre la valeur approprié du [lien ressources], tel que décrit ci-dessus pour [objets relation] [relations]. 

Le niveau supérieur [lie l’objet] [liens] **PEUT** contenir des liens `soi` ainsi que`relation`,
comme décrit ci-dessus pour les [objets relation] [relations]. 

Par exemple, une demande de `AVOIR` vers une URL d’un lien de relation à un pourrait
retourner :

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "/articles/1/relationships/author",
    "related": "/articles/1/author"
  },
  "data": {
    "type": "people",
    "id": "12"
  }
}
```

Si la relation ci-dessus est vide, alors une demande de `GET` vers la même URL serait
retourner :

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "/articles/1/relationships/author",
    "related": "/articles/1/author"
  },
  "data": null
}
```

Une demande de ‘AVOIR` vers une URL d’un lien de relation à plusieurs pourrait revenir :

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "/articles/1/relationships/tags",
    "related": "/articles/1/tags"
  },
  "data": [
    { "type": "tags", "id": "2" },
    { "type": "tags", "id": "3" }
  ]
}
```

Si la relation ci-dessus est vide, alors une demande de `GET`  vers la même URL aurait retourner :

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.api+json

{
  "links": {
    "self": "/articles/1/relationships/tags",
    "related": "/articles/1/tags"
  },
  "data": []
}
```

##### <a href="#fetching-relationships-responses-404" id="fetching-relationships-responses-404" class="headerlink"></a> Autres Réponses

Un serveur **DOIT** retourner `404 Not Found` lors du traitement d’une demande d’extraction une URL de lien de relation qui n’existe pas.
 
> À Noter: Ceci peut se produire lorsque la ressource de parent de la relation
n’existe pas. Par exemple, lorsque `/articles/1` n’existe pas, demandes à
`/articles/1/relations/tags` aurait un retour `404 non trouvent`. 

Si une lien lien URL existe mais la relation est vide, alors
`200 OK` **DOIT** être retournée, comme décrit ci-dessus.

##### <a href="#fetching-relationships-responses-other" id="fetching-relationships-responses-other" class="headerlink"></a> Autres Réponses

Un serveur **PEUT** répondre avec d’autre codes d’état HTTP.
 
Un serveur **PEUT** inclure [détails d’erreur] avec des réponses d’erreur.
 
Un serveur **DOIT** préparer des réponses, et un client **DOIT** interpreter
des réponses, conformément à [“sémantique HTTP”](http://tools.ietf.org/html/rfc7231).

### <a href="#fetching-includes" id="fetching-includes" class="headerlink"></a> Inclusion Des Ressources Associées

Un endpoint **PEUT** retourner les ressources associées aux données par défaut.
 
Un endpoint **PEUT** aussi supporter un paramètre de requête `inclure` pour autoriser le client à choisir quelle ressource associée doit être retournée.
 
Si un endpoint ne supporte pas le paramètre`inclure`, il **DOIT** répondre avec `400 Mauvaise requête` à n’importe quelle requête qui l’inclut.
 
Si un endpoint supporte le paramètre de requête `inclure` et un client l'approvisionne, le serveur **NE DOIT PAS** inclure d’ [objet ressource] non demandé dans la section `inclut` du [document composé].
 
La valeur du paramètre `inclure` **DOIT** être une liste des chemins de relations séparé d’une virgule (U+002C COMMA, “,”). Un chemin de relation est une liste de noms de [relation][relationship] séparés par un point (U+002E POINT, “.”)
 
Si un serveur n’est pas capable d’identifier un chemin de relation ou ne supporte pas l’inclusion de ressources d’un chemin, il **DOIT** répondre avec 400 Mauvaise requête.
 
> Note: par exemple, un chemin de relation peut être `commentaire.auteur`, où `commentaire` est une relation listés sous un `article` [objet ressource][objet ressource] et `auteur` est une relation listée sous un `commentaire` [objet ressour][objet ressource].
 
Par exemple, les `commentaires` peuvent être demandés avec un article.
 
```http
GET /articles/1?include=comments HTTP/1.1
Accept: application/vnd.api+json
```

Dans l’optique de demander des ressources associées à d’autres ressources, un chemin séparé d’un point pour les autres noms de relations peuvent être spécifiés:

```http
GET /articles/1?include=comments.author HTTP/1.1
Accept: application/vnd.api+json
```

> Note: Comme les [documents ressource][documents ressource] requièrent une liaison complète (Sauf lorsque la liaison relationnelle est exclue par des jeux de champs clairsemés), les ressources intermédiaires dans un chemin à parties multiples Doivent être retournés avec les noeuds des pages.
Par exemple, une réponse à une requête pour `commentaire.auteur` devrait inclure `commentaire` avec aussi `auteur` de chacun de ces `commentaires`.
 
> Note: Un serveur peut choisir d’exposer une relation profondément imbriquée comme `commentaire.auteur` comme une relation directe avec un faux nom comme `commentaire-auteur`. Ceci autoriserai un client à effectuer une requête de `/articles/1?include=comment-authors` à la place de `/articles/1?include=comment.authors`. En faisant abstraction de imbriquement de la relation avec un faux nom, le serveur peut toujours fournir un lien complet dans document composé sans inclure une potentielle ressource intermédiaire non voulue
 
Les ressources multiples associées peuvent être demandées dans une liste séparée d’une virgule:

```http
GET /articles/1?include=author,comments.author HTTP/1.1
Accept: application/vnd.api+json
```

Par ailleurs, les ressources associées peuvent être demandée par une relation endpoint
 
```http
GET /articles/1/relationships/comments?include=comments.author HTTP/1.1
Accept: application/vnd.api+json
```

Dans ce cas, les données primaires devraient être une collection de [objet ressource identifiant][objet ressource identifiant] qui représente la liaison à commentaire pour un article
tant que les commentaires complet et commentaire auteurs devraient revenir comme données incluses. 
 
> Note: Cette section s’applique à n’importe quel endpoint qui répond avec les données primaires peu importe le type de requête. Par exemple, un serveur peut supporter l'inclusion d’une ressource associée tout du long avec une requête `POST` pour créer une ressource ou une relation.  

### <a href="#fetching-filtering" id="fetching-filtering" class="headerlink"></a> Filtrage

Le paramètre de requête `filter` est réservé pour filtrer les données. Les filtres sont vues sur les collections, et les serveurs et clients **DOIVENT** utilisés cette clef pour des opérations de filtrage.  

> À noter: API JSON est agnostique à propos des stratégies supportés par un serveur. Le paramètre de requête `filter` peut être utilisé comme une base pour n'importe quel nombre de stratégie de filtrage

## <a href="#query-parameters" id="query-parameters" class="headerlink"></a> Paramètre De Requête

L'implémentation spécifique des paramètres de requête **DOIT** adhérer aux mêmes contraintes que le [Nom des membres] avec les conditions additionnelles qui **DOIVENT** contenir au moins un caractère non a-z (U+0061 to U+007A). Il est **RECOMMANDÉ** qu'un U+002D TIRET, "-", U+005F LIGNE BASSE, "_", ou une lettre capitale est utilisée (e.g. camelCasing).

Si un serveur rencontre un paramètre de requête qui ne suit pas la convention d'appellation ci-dessus, et les serveurs ne savent pas comment procéder c'est un paramètre de requête de cette spécification, il **DOIT** renvoyer `400 Bad Request`.

>À noter: c'est pour préserver la capacité de l'API JSON pour faire des ajouts supplémentaires afin de standardiser les paramètres de requête sans contradictions avec des implémentations existantes. -->
