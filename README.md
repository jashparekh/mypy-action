# Mypy Github Action

GitHub Action for [mypy](https://mypy.readthedocs.io/en/master/).

Influenced by [jpetrucciani/mypy-check](https://github.com/jpetrucciani/mypy-check). 

### Simple

```yaml
name: "Mypy"
on:
  pull_request: {}
  push:
      branches: ["main"]

jobs:
  deploy_schemas:
    runs-on: ubuntu-latest
    name: Mypy
    steps:
      # To use this repository's private action,
      # you must check out the repository
      - name: Checkout
        uses: actions/checkout@v2
      - name: Deploy schemas to BigQuery
        uses: jashparekh/mypy-action@v2
        with:
          path: '.'
          mypy_version: '0.910'
          mypy_flags: '--verbose'
```

## Configuration

### `path` (optional, string)

File or directory to run mypy on.

Default: `.`

### `mypy_version` (optional, string)

Version of mypy library to use for linting.

Default: `0.910`

### `mypy_config_file` (optional, string)

Location of mypy config file in the repository.

Default: `mypy.ini`

### `mypy_flags` (optional, string)

Optional mypy flags (refer to `mypy --help`)

Default: `mypy.ini`
