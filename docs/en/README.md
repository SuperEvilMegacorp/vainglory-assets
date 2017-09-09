# Introduction

The first version of the Vainglory Game Data Service is an exciting step forward towards making it easier for users to have open access to in-game data.

Build something great!

At the moment this Service is in **Alpha Preview** mode. You can see sample data, test the interface, and provide feedback to our development team.

While we initially took a different approach, based on community feedback the Server now makes every attempt to implement the required features of the [JSON-API](http://jsonapi.org/) specification. Where a deviation occurs, it is likely unintentional and can be reported to the team in our [Discord](https://discord.me/vaingloryapi).

We show example language bindings using CURL and plan to add libraries for Ruby, NodeJS, Java, Python and more. Community contributions are welcome and rewarded with good karma \(and swag!\) You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

We're planning to roll out Version 1.0 Q1 2017.

## Versioning {#versioning}

We following [SEMVER](http://semver.org/) standards, using a MAJOR.MINOR.PATCH versioning scheme. This means that we will increment versioning in the following way:

* MAJOR version when we make incompatible API changes,
* MINOR version when we add functionality in a backwards-compatible manner,
* PATCH version when we make backwards-compatible bug fixes.

You can see the current version and deploy date by viewing the [Status](https://api.dc01.gamelockerapp.com/status) endpoint.
