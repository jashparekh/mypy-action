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
