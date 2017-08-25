data.world maintains implementations of API libraries in **Python** and **R**. 

In addition, libraries can be automatically generated for many more languages using the Swagger Codegen tool, including: 
ActionScript, Apex, Bash, C#, C++, Clojure, Dart, Elixir, Eiffel, Go, Groovy, Haskell, Java, Kotlin, Node.js, Objective-C, Perl, PHP, PowerShell, Ruby, Scala, Swift and Typescript.

**Java Users**: Check our data.world's [JDBC driver](https://github.com/datadotworld/dw-jdbc), available on [Maven Central](https://search.maven.org/#search%7Cga%7C1%7Cdw-jdbc).

# Python

## Installation

You can install it using pip directly from [PyPI](https://pypi.python.org/pypi/datadotworld):

```bash
pip install datadotworld
```

Optionally, you can install the library including pandas support:

```bash
pip install datadotworld[pandas]
``` 

If you use conda to manage your python distribution, you can install from the community-maintained [conda-forge](https://anaconda.org/conda-forge/datadotworld-py) channel:

```bash
conda install -c conda-forge datadotworld-py
```

## Usage

For additional information and usage instructions, visit <https://github.com/datadotworld/data.world-py>

# R

To get the current released version from CRAN:

```bash
install.packages("data.world")
```

To get the current development version from GitHub:

```bash
devtools::install_github("datadotworld/data.world-r", build_vignettes = TRUE)
```

## Usage

For additional information and usage instructions, visit <https://github.com/datadotworld/data.world-r>

# Swagger

## What is Swagger?

**Swagger** is a set of open-source tools built around the OpenAPI Specification that can help you design, build, document and consume REST APIs.

The **OpenAPI Specification** (formerly Swagger Specification) is an API description format for REST APIs. An OpenAPI file allows you to describe your entire API, including:

* Available endpoints (`/users`) and operations on each endpoint (`GET /users`, `POST /users`)
* Operation parameters Input and output for each operation
* Authentication methods
* Contact information, license, terms of use and other information.

API specifications can be written in YAML or JSON. The format is easy to learn and is both human-redable and machine-readable.

data.world's public API especification is available at <https://api.data.world/v0/swagger.json>

The complete OpenAPI Specification can be found on GitHub:
[OpenAPI 3.0 Specification](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md)

## Swagger Codegen

### Prerequisites
If you're looking for the latest stable version, you can grab it directly from Maven.org (Java 7 runtime at a minimum):

```bash
wget http://central.maven.org/maven2/io/swagger/swagger-codegen-cli/2.2.3/swagger-codegen-cli-2.2.3.jar -O swagger-codegen-cli.jar

java -jar swagger-codegen-cli.jar help
```

On a mac, it's even easier with `brew` (<https://brew.sh/>):
```bash
brew install swagger-codegen
```

To build from source, you need the following installed and available in your $PATH:

* [Java 7 or 8](http://java.oracle.com)

* [Apache maven 3.3.3 or greater](http://maven.apache.org/)

### Usage

Here is an example usage (assuming tool was installed with Homebrew):
```bash
swagger-codegen generate -i https://api.data.world/v0/swagger.json -l ruby -o /dw-api-ruby
```

For additional information, visit: <https://swagger.io/swagger-codegen/>