# Authorization

> To specify the Headers, use this code:

```shell
  # With shell, you can just pass the correct header with each request
  curl "https://api.dc01.gamelockerapp.com/" \
  -H "Authorization: <api-key>"
  -H "X-TITLE-ID: semc-vainglory"
  -H "Accept: application/vnd.api+json"
```

```java
import java.io.*;
import java.net.*;

URL url = new URL("https://api.dc01.gamelockerapp.com/");
HttpURLConnection conn = (HttpURLConnection) url.openConnection();
conn.setRequestMethod("GET");
conn.setRequestProperty("Authorization","<api-key>");
conn.setRequestProperty("X-TITLE-ID", "semc-vainglory");
conn.setRequestProperty("Accept", "application/vnd.api+json");

conn.getInputStream()
```

```python
import requests

url = "https://api.dc01.gamelockerapp.com/"

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
req, _ := http.NewRequest("GET","https://api.dc01.gamelockerapp.com/",nil)
req.Header.Set("Authorization", "<api-key>")
req.Header.Set("X-TITLE-ID", "semc-vainglory")
req.Header.Set("Accept", "application/vnd.api+json")
res, _ := client.Do(req)
```

We require a JSON Web Token ([JWT](https://jwt.io/)) be sent along with your request via the `Authorization` header.  
JWTs are passed as bearer tokens in the Authorization header, and look like the following:

`Authorization: <Enter your API Key>`


There's no need to create JWTs manually, they will be created for you when you register for the API - [Register Here!](https://developer.vainglorygame.com/users/sign_in)

In some cases an `X-API-KEY` will give you more access to information, and in all
 cases it means that you are operating under a per-token rate limit.

<aside class="notice">
Get ready!  Soon you'll be able to register your app and get a shiny new API key using our developer portal.
</aside>
