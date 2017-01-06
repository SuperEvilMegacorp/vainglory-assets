---
title: VainGlory Game Data Service Reference

language_tabs:
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='#'>Checkout the feature roadmap!</a>
  - <a href='https://gamedevslack.herokuapp.com/'>Chat in Slack (&#35;vaingloryapi!</a>
  - <a href='https://github.com/madglory/gamelocker-'>Help add to our documentation!</a>

includes:
  - matches
  - players
  - teams
  - link
  - errors

search: true

layout: docs
---
# Introduction

The first version of the Vainglory Game Data Service is an exciting step forward
towards making it easier for users to have open access to in-game data.

Build something great!

At the moment this Service is in **Alpha Preview** mode.  You can see sample data,
test the interface, and provide feedback to our development team.  

We show example language bindings using CURL and plan to add libraries for Ruby,
NodeJS, Java, Python and more.  Community contributions are welcome and rewarded with good
karma (and swag!) You can view code examples in the dark area to the right, and
you can switch the programming language of the examples with the tabs in the
top right.

We're planning to roll out Version 1.0 Q1 2017.

# Message Format

While we initially took a different approach, based on community feedback
the Server now makes every attempt to implement the required features of the
[JSON-API](http://jsonapi.org/) specification.  
Where a deviation occurs, it is likely unintentional and can
be reported to the team in our [Slack (#vaingloryapi)](gamedevelopment.slack.com).

# Content Negotiation

Clients using the api should specify that they accept responses using the
`application/vnd.api+json` format. For convenience we also accept `application/json`
since it is the default for many popular client libraries.

The Server will respond with a `Content-Type` header that mirrors the format
requested by the Client.

# Response Structure

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

## Titles

> To specify the title, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "https://api.gamelockerapp.com"
  -H "X-TITLE-ID: vainglory"
```

All endpoints require an `X-TITLE-ID` header in order to return data.  It looks like the following:

`X-TITLE-ID: vainglory`

<aside class="notice">
No no, this isn't a hint at more Super Evil game titles.  The Vainglory Game Data
Service uses a platform called Gamelocker which system itself can store multiple titles.
</aside>

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
curl "https://api.gamelockerapp.com"
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

# Rate Limits
Be nice. If you're sending too many requests too quickly, we'll send back a
`429` error code (server unavailable).

We're still working on deciding what limits will actually be in place when
we go live.  Let us know your what you'd like to build and we'll plan
accordingly.  
