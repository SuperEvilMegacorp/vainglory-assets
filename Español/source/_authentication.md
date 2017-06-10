# Autorización
 
> Para especificar los Headers, utiliza este código:

```shell
  # Con shell, solo puedes pasar la cabecera (header) correcta en cada petición
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

Requerimos que un JSON Web Token ([JWT](https://jwt.io/)) sea enviado con tu petición vía el `Authorization` header.  
JWTs son pasados como bearer tokens en el Authorization header,y se ven de esta manera:

`Authorization: <Enter your API Key>`

No hace falta crear JWTs manualmente, serán creados para tí cuando te registres en el API - [registrate aquí!](https://developer.vainglorygame.com/users/sign_in)
 
En algunos casos un `X-API-KEY` te dará mejor acceso a información, y en todos casos significa que estás operando bajo un per-token límite de ratio.
 
<aside class="notice">
Prepárate! Pronto podrás registrar tu app y conseguir una nueva llave API utilizando nuestro developer portal.
</aside>
