data.world maintains implementations of API libraries in **Python** and **R**. 

In addition, libraries can be automatically generated for many more languages using the Swagger Codegen tool, including: 
ActionScript, Apex, Bash, C#, C++, Clojure, Dart, Elixir, Eiffel, Go, Groovy, Haskell, Java, Kotlin, Node.js, Objective-C, Perl, PHP, PowerShell, Ruby, Scala, Swift and Typescript.

# Python

## Installation

You can install it using pip directly from PyPI:

```sh
pip install datadotworld
```

Optionally, you can install the library including pandas support:

```sh
pip install datadotworld[pandas]
``` 

If you use conda to manage your python distribution, you can install from the community-maintained [conda-forge](https://conda-forge.github.io/) channel:

```sh
conda install -c conda-forge datadotworld-py
```

## Usage

For addition information and usage instructions, visit <https://github.com/datadotworld/data.world-py>

# R

To get the current released version from CRAN:

```sh
install.packages("data.world")
```

To get the current development version from GitHub:

```sh
devtools::install_github("datadotworld/data.world-r", build_vignettes = TRUE)
```

## Usage

For addition information and usage instructions, visit <https://github.com/datadotworld/data.world-r>

# Swagger Codegen

## Prerequisites
If you're looking for the latest stable version, you can grab it directly from Maven.org (Java 7 runtime at a minimum):

```sh
wget http://central.maven.org/maven2/io/swagger/swagger-codegen-cli/2.2.3/swagger-codegen-cli-2.2.3.jar -O swagger-codegen-cli.jar

java -jar swagger-codegen-cli.jar help
```

On a mac, it's even easier with `brew`:
```sh
brew install swagger-codegen
```

To build from source, you need the following installed and available in your $PATH:

* [Java 7 or 8](http://java.oracle.com)

* [Apache maven 3.3.3 or greater](http://maven.apache.org/)

## Usage

Here is an example usage (assuming tool was installed with Homebrew):
```sh
swagger-codegen generate -i https://api.data.world/v0/swagger.json -l ruby -o /dw-api-ruby
```

For additional information, visit: <https://swagger.io/swagger-codegen/>