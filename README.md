# data.world — Public API specification

This repository contains the [OpenAPI](https://github.com/OAI/OpenAPI-Specification) (a.k.a. 
Swagger) specification for the [data.world's API](https://docs.data.world/documentation/api/).

## Documentation

Reference documentation and code examples for this API can be found at: 
https://docs.data.world/documentation/api/

## Development

To run local (mock) instance of this API during development, use [Prism](http://stoplight.io/platform/prism/)
```bash
curl https://raw.githubusercontent.com/stoplightio/prism/master/install.sh | sh &&
  prism run --mock --list --spec src/main/resources/world/data/api/swagger.json
```

## Contributing

The data.world API specification is an open source project. Community participation is encouraged.
If you'd like to contribute, please follow the [Contributing Guidelines](CONTRIBUTING.md).

## License

Apache License 2.0