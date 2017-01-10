# Authentication

> To specify the API key, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "https://api.dc01.gamelockerapp.com" \
  -H "X-API-KEY: getoffmylawn"
```

> Make sure to replace `getoffmylawn` with your API key. (For now though, just use it.  It's alive!)

We require the API key to be included in all API requests to the server in a header that looks like the following:

`X-API-KEY: getoffmylawn`

Eventually you will be able to register for your own `X-API-KEY` but for now anything is accepted.
In some cases an `X-API-KEY` will give you more access
to information, and in all cases it means that you are operating under a per-key
rate limit.

<aside class="notice">
Get ready!  Soon you'll be able to register your app and get a shiny new API key using our developer portal.
</aside>
