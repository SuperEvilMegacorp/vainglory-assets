# JSON-P Rappels
 
Vous pouvez envoyez un paramètre de rappel de service à chacun pour OBTENIR l’appel afin d’avoir les résultats enveloppés dans une fonction JSON. C’est typiquement utilisé quand les navigateurs veulent intégrer le contenu dans les pages web en contournant les problèmes entre domaines. La réponse inclut la même sortie de données que l’API régulier, plus les informations HTTP d'en-tête pertinentes.
 
```shell
curl https://api.dc01.gamelockerapp.com/status?callback=foo
```

```javascript
foo({
  "meta": {  
    "content-length":34,
    "content-type":"application/json; charset=utf-8",
    "status":200
  },
  "data": {
    ...  // the data
  }
})
```
