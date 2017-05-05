# Autorisation

> Pour spécifier les en-têtes, utilisez ce code:

```shell
  # Avec shell, vous pouvez juste passer l'en-tête correct avec chaque demande:
  curl "<endpoint-url>" \
  -H "Authorization: <api-key>"
  -H "X-TITLE-ID: semc-vainglory"
  -H "Accept: application/vnd.api+json"
```

```java
import java.io.*;
import java.net.*;

URL url = new URL("<endpoint-url>");
HttpURLConnection conn = (HttpURLConnection) url.openConnection();
conn.setRequestMethod("GET");
conn.setRequestProperty("Authorization","<api-key>");
conn.setRequestProperty("X-TITLE-ID", "semc-vainglory");
conn.setRequestProperty("Accept", "application/vnd.api+json");

conn.getInputStream()
```

```python
import requests

url = "<endpoint-url>"

header = {
    "Authorization": "<api-key>",
    "X-TITLE-ID": "semc-vainglory",
    "Accept": "application/vnd.api+json"
}

r = requests.get(url, headers=header)
```

```ruby
```

```javascript
```

```go
import "net/http"

client := &http.Client{}
req, _ := http.NewRequest("GET","<endpoint-url>",nil)
req.Header.Set("Authorization", "<api-key>")
req.Header.Set("X-TITLE-ID", "semc-vainglory")
req.Header.Set("Accept", "application/vnd.api+json")
res, _ := client.Do(req)
```

Nous demandons qu'un jeton JSON Web ([JWT](https://jwt.io/)) soit envoyé avec votre demande via l'en-tête `Autorisation`.
JWTs sont passés comme des jetons de support dans l'en-tête d'autorisation, et ressembler à ceci:

`Autorisation: <Entrez votre clé d'API>`

Il n'est pas nécessaire de créer des JWT manuellement, ils seront créés pour vous lorsque vous vous inscrivez à l'API - [Inscrivez-vous ici!](https://developer.vainglorygame.com/users/sign_in)

Dans certains cas, un `X-API-KEY` vous donnera plus d'accès à l'information, et dans tous les cas, cela signifie que vous utilisez une limite de taux par jeton.

<aside class="notice">
Soyez prêt! Bientôt, vous pourrez enregistrer votre application et obtenir une nouvelle clé API brillante à l'aide de notre portail de développeurs.
</aside>