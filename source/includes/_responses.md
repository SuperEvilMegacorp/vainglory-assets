# Receiving Responses

## Payload

All Server responses contain a root JSON object.  

A response will contain at least one of the following top-level members:

  * `data`: the response's “primary data”
  * `errors`: an array of error objects

A response may contain any of these top-level members:

  * `links`: a links object related to the primary data.
  * `included`: an array of resource objects that are related to the primary data and/or each other (“included resources”).

If a document does not contain a top-level data key, the included member will not be present either.

Primary data will be either:

  * a single [resource object][resource objects], a single [resource identifier object], or `null`
  * an array of [resource objects], an array of [resource identifier objects][resource identifier object], or
  an empty array (`[]`)

For example, the following primary data is a single resource object:

~~~.language-json
{
  "data": {
    "type": "match",
    "id": "skarn",
    "attributes": {
      // ... this matches attributes
    },
    "relationships": {
      // ... this matches relationships
    }
  }
}
~~~

The following primary data is a single [resource identifier object] that
references the same resource:

~~~.language-json
{
  "data": {
    "type": "match",
    "id": "1"
  }
}
~~~

A logical collection of resources will always be represented as an array, even if
it only contains one item or is empty.

## Rate Limits
Be nice. If you're sending too many requests too quickly, we'll send back a
`429` error code (server unavailable).

We're still working on deciding what limits will actually be in place when
we go live.  Let us know what you'd like to build and we'll plan
accordingly.
