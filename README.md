# data.world — Public API specification

This repository contains the [OpenAPI](https://github.com/OAI/OpenAPI-Specification) (a.k.a.
Swagger) specification for the [data.world's API](https://apidocs.data.world/).

## Documentation

Reference documentation and code examples for this API can be found at:
https://apidocs.data.world/

## Development

To run local (mock) instance of this API during development, use [Prism](http://stoplight.io/platform/prism/)
```bash
curl https://raw.githubusercontent.com/stoplightio/prism/master/install.sh | sudo sh &&
  prism run --mock --list --spec src/main/resources/world/data/api/swagger.json
```

## Release 

Grab your CI token from [CircleCI API Token](https://circleci.com/account/api) then run the following command in the terminal.
 * export CIRCLE_TOKEN= CircleCI API Token
 * export DWAPISPEC_RELEASE_USER_EMAIL= Your email address
 * export DWAPISPEC_NOW_VERSION= Version number for current release
 * export DWAPISPEC_NEXT_VERSION= Version number to be used for snapshot
 * ./dwapi-spec/release.sh 

## Contributing

The data.world API specification is an open-source project. Community participation is encouraged.
If you'd like to contribute, please follow the [Contributing Guidelines](CONTRIBUTING.md).

## License

Apache License 2.0
