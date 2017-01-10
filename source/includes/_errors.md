## Errors

The server will stop processing if a problem is encountered and return the correct
HTTP error status code.  Errors may additionally include error objects, which are
returned as an array keyed by `errors` in the top level of a JSON API document.

An error objects will have the following members:

* `status`: the HTTP status code applicable to this problem, expressed as a
  string value.
* `title`: a short summary of the problem

The Server uses the following error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request sucks
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- The object requested is hidden for administrators only
404 | Not Found -- The specified object could not be found
405 | Method Not Allowed -- You tried to access a object with an invalid method
406 | Not Acceptable -- You requested a format that isn't JSON
410 | Gone -- The object requested has been removed from our servers
418 | I'm a teapot
429 | Too Many Requests -- You're requesting too much data! Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
