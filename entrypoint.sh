#!/bin/bash
set -ax

# mypy output file
output_file=/tmp/mypy.out

lint_path=${1:-.}
mypy_version=${2:-0.910}
mypy_config_file=${3:-""}
mypy_flags=${4:-""}

# get mypy version
mypy --version

# run mypy, tee output to file
# shellcheck disable=2086
#mypy $2 --show-column-numbers --hide-error-context $1 | tee "${output_file}"
#exit_code="${PIPESTATUS[0]}"
#
## analyze output
#python /github.py "${output_file}"
#
#exit "$exit_code"
