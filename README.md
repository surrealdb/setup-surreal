# setup-surreal

Github CI integration for SurrealDB using Github Actions.

## Arguments

Here you see an overview of arguments you can use with setup-surreal action. In the
column `Default` you can see the default value of the argument. If you don't
provide a value for an argument, the default value will be used. But for those
arguments that don't have a default value are optional and are not used unless
you provide a value for them.

| Argument | Description                   | Default | Value                                            |
| -------- | ----------------------------- | ------- | ------------------------------------------------ |
| VERSION  | SurrealDB version to use      | latest  | `latest`, `v1.x.x`                               |
| PORT     | Port to run SurrealDB on      | 8000    | `any number`                                     |
| USER     | Username to use for SurrealDB |         | `up to the user`                                 |
| PASSWORD | Password to use for SurrealDB |         | `up to the user`                                 |
| AUTH     | Enable authentication         |         | `true`, `false`                                  |
| STRICT   | Enable strict mode            |         | `true`, `false`                                  |
| LOG      | Enable logs                   |         | `none`, `full`, `warn`, `info`, `debug`, `trace` |

## Usage

```yaml
name: SurrealDB CI

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
    - name: Git checkout
      uses: actions/checkout@v2
    - name: Start SurrealDB
      uses: surrealdb/setup-surreal@v1
      with:
        VERSION: latest
        PORT: 8000
        USERNAME: root
        PASSWORD: root
        AUTH: false
        STRICT: false
        LOG: info
```

## License

This GitHub Action is released under the [Apache License 2.0](https://github.com/surrealdb/license/blob/main/APL.txt).
