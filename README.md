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
  run_mypy:
    runs-on: ubuntu-latest
    name: Mypy
    steps:
      # To use this repository's private action,
      # you must check out the repository
      - name: Checkout
        uses: actions/checkout@v2
      - name: Run Mypy
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

### `requirements` (optional, string)

Optional, if not empty specified libraries will be installed before running `mypy`

Default: `""`

### `requirement_files` (optional, string)

Optional, if not empty specified install all the libraries specified in the files before running `mypy`

Default: `""`

### `python_version` (optional, string)

Python version to use to run lint

Default: `3.10`
