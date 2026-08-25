# setup-surreal

Github CI integration for SurrealDB using Github Actions.

## Arguments

Here you see an overview of arguments you can use with setup-surreal action. In
the column `Default` you can see the default value of the argument. If you don't
provide a value for an argument, the default value will be used. But for those
arguments that don't have a default value are optional and are not used unless
you provide a value for them.

| Argument                  | Description                                    | Default  | Value                                                                                |
| ------------------------- | ---------------------------------------------- | -------- | ------------------------------------------------------------------------------------ |
| surrealdb_version         | SurrealDB version to use                       | `latest` | `latest`, `nightly`, `beta`, `alpha`, `v1.x.x`, `v2.x.x`, `v3.x.x`                   |
| surrealdb_datastore       | Datastore to start SurrealDB with              | `memory` | Any [datastore path](https://surrealdb.com/docs/surrealdb/cli/start#), e.g. `rocksdb:data` |
| surrealdb_port            | Port to run SurrealDB on                       | `8000`   | Valid number from `0` to `65535`                                                     |
| surrealdb_username        | Username to use for SurrealDB                  | `root`   | Customisable by the user                                                             |
| surrealdb_password        | Password to use for SurrealDB                  | `root`   | Customisable by the user                                                             |
| surrealdb_auth            | Enable authentication                          | `false`  | `true`, `false`                                                                      |
| surrealdb_strict          | Enable strict mode                             | `false`  | `true`, `false`                                                                      |
| surrealdb_log             | Enable logs                                    | `trace`  | `none`, `full`, `error`, `warn`, `info`, `debug`, `trace`                             |
| surrealdb_import_file     | SurrealQL file to import on startup            |          | Path to a `.surql` file, requires SurrealDB `v3.0.0` or later                        |
| surrealdb_additional_args | Additional arguments for SurrealDB             |          | [Any valid SurrealDB CLI arguments](https://surrealdb.com/docs/surrealdb/cli/start#) |
| surrealdb_retry_count     | Seconds to wait for SurrealDB to become ready  | `30`     | Any valid integer                                                                    |

The file passed to `surrealdb_import_file` selects its own namespace and
database, so it should begin with a `USE NS ... DB ...;` statement.

## Outputs

| Output   | Description                                                |
| -------- | ---------------------------------------------------------- |
| endpoint | The HTTP endpoint the SurrealDB instance is listening on    |
| version  | The exact version of SurrealDB that was installed           |

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
      id: surrealdb
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
    - name: Run the tests
      run: cargo test
      env:
        SURREALDB_ENDPOINT: ${{ steps.surrealdb.outputs.endpoint }}
```

## License

This GitHub Action is released under the
[Apache License 2.0](https://github.com/surrealdb/license/blob/main/APL.txt).
