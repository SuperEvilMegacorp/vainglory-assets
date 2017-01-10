# Content Negotiation

Clients using the api should specify that they accept responses using the
`application/vnd.api+json` format. For convenience we also accept `application/json`
since it is the default for many popular client libraries.

The Server will respond with a `Content-Type` header that mirrors the format
requested by the Client.
