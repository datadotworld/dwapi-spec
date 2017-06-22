# Contributing Guidelines

## General

* Keep in mind that this is a design project. Contributions of all kinds (issues, ideas, 
proposals), not just code, are highly appreciated.
* Pull requests are welcome with the understanding that changes proposed to actual operations, 
parameters and responses will be carefully evaluated and discussed, and may not always be accepted.
* All contributions including documentation, filenames and discussions should be written in English language.

## Issues

Our [issue tracker](https://github.com/datadotworld/dwapi-specs/issues) can be used to report 
issues and propose changes to the current or next version of the data.world API specification.

Please follow these guidelines before opening an issue:
* Make sure your issue is not a duplicate.
* Make sure your issue is relevant to the specification.

## Contribute Code

### Fork the Project

Fork the [project on Github](https://github.com/datadotworld/dwapi-spec) and check out your copy.

```
git clone https://github.com/[YOUR_GITHUB_NAME]/dwapi-spec.git
cd dwapi-spec
git remote add upstream https://github.com/datadotworld/dwapi-spec.git
```

### Install and Test

Ensure that you can build the project and run tests.

Install [Prism](http://stoplight.io/platform/prism/) if necessary:
```bash
curl https://raw.githubusercontent.com/stoplightio/prism/master/install.sh | sh
```

Run tests:
```bash
prism conduct --spec src/main/resources/world/data/api/swagger.json spec/*.json
```

### Create a Feature Branch

Make sure your fork is up-to-date and create a feature branch for your feature or bug fix.

```bash
git checkout master
git pull upstream master
git checkout -b my-feature-branch
```

### Write Tests

Try to write a test that reproduces the problem you're trying to fix or describes a feature that you want to build. Add tests to [spec](spec).

We definitely appreciate pull requests that highlight or reproduce a problem, even without a fix.

### Write Code

Implement your feature or bug fix.

Make sure that `prism conduct --spec src/main/resources/world/data/api/swagger.json spec/*.json` completes without errors.

### Write Documentation

Document any external behavior in the [README](README.md).

### Commit Changes

Make sure git knows your name and email address:

```bash
git config --global user.name "Your Name"
git config --global user.email "contributor@example.com"
```

Writing good commit logs is important. A commit log should describe what changed and why.

```bash
git add ...
git commit
```

### Push

```bash
git push origin my-feature-branch
```

### Make a Pull Request

Go to https://github.com/[YOUR_GITHUB_NAME]/dwapi-spec and select your feature branch. Click the 'Pull Request' button and fill out the form. Pull requests are usually reviewed within a few days.

## Conventions

Due to limitations in swagger-maven-plugin 3.1.2 and or assertj-swagger (which are used in the 
implementation of this design), this swagger definition 
must not include:

1. Global `consumes` or `produces`. Those must be defined for each operation.
2. JSON examples. Examples must be stringified JSON.
3. Response references. The response schema can be a reference, but not the response itself.

## Thank you!

Thank you in advance, for contributing to this project!