#!/bin/bash
set -ax

mypy_args=""

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
if [ $mypy_config_file ]
then
  mypy_args+=" --config-file=${mypy_config_file}"
fi

# concat mypy flags if provided
if [ "$flags" ]
then
  mypy_args += " $flags"
fi

# run mypy, tee output to file
# shellcheck disable=2086
mypy --show-column-numbers --hide-error-context ${mypy_args} ${lint_path} | tee "${output_file}"
exit_code="${PIPESTATUS[0]}"

# analyze output
python /github.py "${output_file}"

exit "$exit_code"
