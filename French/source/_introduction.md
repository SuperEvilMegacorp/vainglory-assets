# Introduction

La première version du Vainglory Game Data Service est une étape passionnante vers un accès plus ouvert et facile pour les utilisateurs d'avoir acces aux données dans le jeu.

Construire quelque chose de grand!

Actuellement, ce service est en **Alpha**. Vous pouvez voir des exemples de données, tester l'interface et fournir des commentaires à notre équipe de développement.

Alors que nous avons initialement adopté une approche différente, basée sur les commentaires de la communauté, le serveur fait maintenant tout son possible pour mettre en œuvre les fonctionnalités requises de la spécification [JSON-API](http://jsonapi.org). Si une déviation survient, elle est intentionnelle et peut être signalé à l'équipe dans notre [discorde](https://discord.me/vaingloryapi).

Nous montrons des liaisons de langage en utilisant par exemple CURL et prevoyons d’ajouter des bibliothèques pour Ruby, NodeJS, Java, Python et plus encore. Les contributions de la communauté sont les bienvenues et récompensées par un bon karma (et du swag!) Vous pouvez afficher des exemples de code dans la zone sombre à droite et vous pouvez changer le langage de programmation des exemples avec les onglets en haut à droite.

Nous prévoyons de déployer la version 1.0 Q1 2017.

## Versionnement

Nous suivons les normes [SEMVER](http://semver.org/), en utilisant un système de version MAJOR.MINOR.PATCH. Cela signifie que nous incrémenterons le versioning de la manière suivante:

  * MAJOR version lorsque nous faisons des changements API incompatibles,
  * MINOR version quand nous ajoutons une fonctionnalité dans une manière compatible vers l'arrière,
  * PATCH lorsque nous faisons des corrections de bogues compatibles vers l'arrière.

Vous pouvez voir la version actuelle et la date de déploiement en affichant le point de terminaison Statut.