#!/bin/bash
set -ax

args = ""

# mypy output file
output_file=/tmp/mypy.out

lint_path=${1:-.}
mypy_version=${2:-0.910}
mypy_config_file=$3
flags=$4

pip install mypy==${mypy_version}

# get mypy version
mypy --version

# concat mypy config file if provided
if [ -z "$mypy_config_file" ] then
  args = "${args} --config-file=${mypy_config_file}"

# concat mypy flags if provided
if [ -z "$flags" ] then
  args = "${args} ${flags}"

# run mypy
mypy --show-column-numbers --hide-error-context $flags
