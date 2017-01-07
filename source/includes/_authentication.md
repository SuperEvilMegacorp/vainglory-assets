# Authentication

> To specify the API key, use this code:

<!-- ```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
``` -->

```shell
# With shell, you can just pass the correct header with each request
curl "https://api.dc01.gamelockerapp.com"
  -H "X-API-KEY: getoffmylawn"
```

<!-- ```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
``` -->

> Make sure to replace `getoffmylawn` with your API key. (For now though, just use it.  It's alive!)

All endpoints require an `X-API-KEY` header in order to return data.  Eventually
you will be able to register for your own `X-API-KEY` but for now you'll find
a sample key below. In some cases an `X-API-KEY` will give you more access
to information, and in all cases it means that you are operating under a per-key
rate limit.

We require the API key to be included in all API requests to the server in a header that looks like the following:

`X-API-KEY: getoffmylawn`

<aside class="notice">
Get ready!  Soon you'll be able to register your app and get a shiny new API key using our developer portal.
</aside>
