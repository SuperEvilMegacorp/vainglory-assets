# Cross Origin Resource Sharing
The API supports Cross Origin Resource Sharing (CORS) for AJAX requests from any origin.
You can read the CORS W3C Recommendation, or this intro from the HTML 5 Security Guide.

Here's a sample request sent from a browser hitting http://example.com:

```shell
curl -i https://api.dc01.gamelockerapp.com/status -H "Origin: http://example.com"
  HTTP/1.1 200 OK
  ...
  Access-Control-Allow-Origin: *
  Access-Control-Expose-Headers: Content-Length
```
This is what the CORS preflight request looks like:

```shell
curl -i https://api.dc01.gamelockerapp.com/status -H "Origin: http://example.com" -X OPTIONS
  HTTP/1.1 200 OK
  ...
  Access-Control-Allow-Headers: Origin,X-Title-Id,Authorization
  Access-Control-Allow-Methods: GET,POST,OPTIONS
  Access-Control-Allow-Origin: *
  Access-Control-Max-Age: 86400
```
