---
title: VainGlory Game Data API Reference

language_tabs:
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='#'>Checkout the feature roadmap!</a>
  - <a href='https://gamedevslack.herokuapp.com/'>Chat in Slack vaingloryapi!</a>
  - <a href='https://github.com/madglory/gamelocker-'>Help add to our documentation!</a>

includes:
  - matches
  - players
  - teams
  - guilds
  - links
  - errors

search: true

layout: docs
---
# Introduction

The first version of the Vainglory Developer API is an exciting step forward
towards making it easier for users to have open access to in-game data.

Build something great!

At the moment this API is in **Alpha Preview** mode.  You can see sample data,
test the interface, and provide feedback to our development team.  

We have language bindings in Shell, Ruby, and Python! You can view code examples
in the dark area to the right, and you can switch the programming language of
the examples with the tabs in the top right.

We're planning to roll out version 1.0 Q1 2017.


# Authentication

> To authorize, use this code:

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
```

> Make sure to replace `meowmeowmeow` with your API key.

All endpoints require an `X-API-KEY` header in order to return data.  Eventually
you will be able to register for your own `X-API-KEY` but for now you'll find
a sample key below. In some cases an `X-API-KEY` will give you more access
to information, and in all cases it means that you are operating under a per-key
rate limit.

We require the API key to be included in all API requests to the server in a header that looks like the following:

`X-API-KEY: 3wCUeHy6RiRBoVjQfbTz32yk9nlUXdj8RzwPd5rj`

<aside class="notice">
Get ready!  Soon you'll be able to register your app and get a shiny new API key using our developer portal.
</aside>

# Rate Limits
Be nice. If you're sending too many requests too quickly, we'll send back a
`429` error code (server unavailable).

We're still working on deciding what limits will actually be in place when
we go live.  Let us know your what you'd like to build and we'll plan
accordingly.

# Data Format
We generally follow a JSON-API standards. We consider this a roadmap rather than
a prescription and will add new JSON-API features in future versions of the API.
 If we're missing something that you need, let us know!

### Responses
Every response is contained by an envelope. That is, each response has a
predictable set of keys with which you can expect to interact:

~~~.language-json
{
  "error": true,
  "data": {},
  "meta": {}
}
~~~
