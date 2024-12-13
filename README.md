# setup-surreal

Github CI integration for SurrealDB using Github Actions.

## Arguments

Here you see an overview of arguments you can use with setup-surreal action. In
the column `Default` you can see the default value of the argument. If you don't
provide a value for an argument, the default value will be used. But for those
arguments that don't have a default value are optional and are not used unless
you provide a value for them.

| Argument                  | Description                        | Default | Value                                                                                |
| ------------------------- | ---------------------------------- | ------- | ------------------------------------------------------------------------------------ |
| surrealdb_version         | SurrealDB version to use           | latest  | `latest`, `v1.x.x`, `v2.x.x`                                                         |
| surrealdb_port            | Port to run SurrealDB on           | 8000    | Valid number from `0` to `65535`                                                     |
| surrealdb_username        | Username to use for SurrealDB      |         | Customisable by the user                                                             |
| surrealdb_password        | Password to use for SurrealDB      |         | Customisable by the user                                                             |
| surrealdb_auth            | Enable authentication              |         | `true`, `false`                                                                      |
| surrealdb_strict          | Enable strict mode                 |         | `true`, `false`                                                                      |
| surrealdb_log             | Enable logs                        |         | `none`, `full`, `warn`, `info`, `debug`, `trace`                                     |
| surrealdb_additional_args | Additional arguments for SurrealDB |         | [Any valid SurrealDB CLI arguments](https://surrealdb.com/docs/surrealdb/cli/start#) |
| surrealdb_retry_count     | Amount of availability retries | 30 | Any valid integer that represent `x` amount of seconds |

## Usage

```yaml
name: SurrealDB CI

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
    - name: Git checkout
      uses: actions/checkout@v4
    - name: Start SurrealDB
      uses: surrealdb/setup-surreal@v2
      with:
        surrealdb_version: latest
        surrealdb_port: 8000
        surrealdb_username: root
        surrealdb_password: root
        surrealdb_auth: false
        surrealdb_strict: false
        surrealdb_log: info
        surrealdb_additional_args: --allow-all
        surrealdb_retry_count: 30
```

## License

This GitHub Action is released under the
[Apache License 2.0](https://github.com/surrealdb/license/blob/main/APL.txt).
