# Erreur 

Le serveur arrêtera le traitement si un problème est rencontré et renvoie le code d'état d'erreur HTTP correct. Les erreurs peuvent en outre inclure des objets d'erreur, qui sont renvoyés sous la forme d'un tableau protégé par des erreurs au niveau supérieur d'un document JSON API.

Les objets d'erreurs sont affichés de la manière suivante:

* `Titre`: (Obligatoire) le code d'état HTTP applicable à ce problème, exprimé en valeur de chaîne.
* `description`: (facultatif) un bref résumé du problème

Le serveur utilise les codes d'erreur suivants:

Code d'erreur | Signification
---------- | -------
400 | Bad Request -- votre demande est incorrecte 
401 | Unauthorized -- Votre clé API est incorrecte
403 | Forbidden -- L'objet demandé est accessible uniquement pour les administrateurs
404 | Not Found -- L'objet spécifié n'a pas pu être trouvé
405 | Method Not Allowed -- Vous avez essayé d'accéder à un objet avec une méthode non valide
406 | Not Acceptable -- Vous avez demandé un format qui n'est pas JSON
410 | Gone -- L'objet demandé a été supprimé de nos serveurs
418 | Je suis une théière
429 | Too Many Requests -- Vous demandez trop de données! Ralentissez!
500 | Internal Server Error -- Nous avons eu un problème avec notre serveur. Réessayez plus tard.
503 | Service Unavailable -- Nous sommes temporairement déconnectés pour la maintenance. Veuillez réessayer plus tard.
