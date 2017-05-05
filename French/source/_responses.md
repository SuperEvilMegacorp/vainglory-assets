# Réponses De Réception

## Charge Utile

Toutes les réponses du serveur contiennent un objet JSON racine.

~~~.language-json
{
  "data": {
    "type": "match",
    "id": "skarn",
    "attributes": {
      // ... this matches attributes
    },
    "relationships": {
      // ... this matches relationships
    }
  }
}
~~~

~~~.language-json
{
  "data": {
    "type": "match",
    "id": "1"
  }
}
~~~

Une réponse contiendra au moins un des membres de niveau supérieur suivants:

  * `Données`: les "données primaires"
  * `Erreurs`: un tableau d'objets d'erreur

Une réponse peut contenir l'un de ces membres de niveau supérieur:

  * `Links`: un objet links lié aux données primaires.
  * `Inclus`: un tableau d'objets de ressources qui sont liés aux données primaires et / ou les uns aux autres ("ressources incluses").

Si un document ne contient pas de clé de données de niveau supérieur, le membre inclus ne sera pas présent non plus.

Les données primaires seront soit:

 [objets ressource]
 [identificateur de ressource objet]


  * Un seul [objet ressource][resource objects], un seul [objet identificateur de ressource] ou `nulle`
  * Un tableau de [objets ressource], un tableau de [identificateur de ressource objets][resource identifier object], ou un tableau vide (`[]`)

Par exemple, les données primaires suivantes sont un objet ressource unique:


Les données primaires suivantes sont un seul [identificateur de ressource] qui fait référence à la même ressource:


Une collection logique de ressources sera toujours représentée sous forme de tableau, même si elle ne contient qu'un élément ou est vide.

## Limites tarifaires
>The rate limit headers are defined as follows:

~~~
X-RateLimit-Limit - Limite de demande par jour / par minute
X-RateLimit-Restant - Le nombre de demandes laissées pour la créneau d'heure
X-RateLimit-Reset - La fenêtre restante avant la limite de débit est rempli en UTC époque nanoseconde​.
*  Les jetons de limite sont intégrés progressivement de 60 (sec) / limite de débit. Ex: 60 (sec) / 10 (taux) reçoit un jeton de taux toutes les 6 secondes jusqu'à la limite de débit maximal.
~~~
Soyez gentil. Si vous envoyez trop de demandes trop rapidement, nous vous renverrons un code `429` d'erreur (serveur indisponible).

<aside class="notice">
Gratuit pour une utilisation non commerciale jusqu'à 10 demandes par minute! Pour augmenter votre limite de taux, veuillez contacter api@superevilmegacorp.com
</aside>
