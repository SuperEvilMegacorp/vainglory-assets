---
title: Vainglory Game Data Service Reference

language_tabs:
  - shell
  - java
  - python
  - javascript
  - go


toc_footers:
  - <a href='https://github.com/shards/na/madglory/gamelocker-vainglory/milestones'>Build the Roadmap!</a>
  - <a href='http://discord.me/vaingloryapi'>Chat on Discord!</a>
  - <a href='https://github.com/madglory/gamelocker-vainglory'>Peep the Docs!</a>
  - <a href='https://github.com/madglory/gamelocker-vainglory/issues'>Log a bug!</a>

includes:
  - datacenters
  - authentication
  - titles
  - requests
  - responses
  - matches
  - players
  - errors

search: true

layout: docs
---
# Introduction
```python
# requires you to install `python-gamelocker` via pip
# https://pypi.python.org/pypi/python-gamelocker/
import gamelocker
```

```go
//Import the following URL
import v "github.com/madglory/vainglory-go-client"
```

```javascript
$ yarn add vainglory
or
$ npm install vainglory

import Vainglory from 'vainglory';
```



The first version of the Vainglory Game Data Service is an exciting step forward
towards making it easier for users to have open access to in-game data.

Build something great!

At the moment this Service is in **Alpha Preview** mode.  You can see sample data,
test the interface, and provide feedback to our development team.  

While we initially took a different approach, based on community feedback
the Server now makes every attempt to implement the required features of the
[JSON-API](http://jsonapi.org/) specification. Where a deviation occurs, it is likely
unintentional and can be reported to the team in the [Vainglory API community Discord](http://discord.me/vaingloryapi).

We show example language bindings using CURL and plan to add libraries for Ruby,
NodeJS, Java, Python and more. You can view code examples in the dark area to the right, and
you can switch the programming language of the examples with the tabs in the
top right.

We're planning to roll out Version 1.0 Q1 2017.


## Versioning

We following [SEMVER](http://semver.org/) standards, using a MAJOR.MINOR.PATCH versioning scheme. This means that we will increment versioning in the following way:

  * MAJOR version when we make incompatible API changes,
  * MINOR version when we add functionality in a backwards-compatible manner,
  * PATCH version when we make backwards-compatible bug fixes.

You can see the current version and deploy date by viewing the [Status](https://api.dc01.gamelockerapp.com/status) endpoint.


## Community API's

Community contributions are welcome and rewarded with good karma (and swag!)
If you are currently working on an API, let us know on the Discord server and we will add a link!

**Java**

* [DominicGunn/flicker] (http://github.com/DominicGunn/flicker) A Java adaptation of the Vainglory API.

**Python**

* [schneefux/python-gamelocker] (http://github.com/schneefux/python-gamelocker) Python 3 wrapper for the Gamelocker API.

**JavaScript**

* [seripap/vainglory] (https://github.com/seripap/vainglory) A JavaScript API client.

**R**

* [nathancarter/rvgapi] (https://github.com/nathancarter/rvgapi) A project providing R6 classes (for the R language) for accessing the API.

**Go**

* [madglory/vainglory-go-client] (https://github.com/madglory/vainglory-go-client) A proof of concept go client for the Vainglory Developer API.
