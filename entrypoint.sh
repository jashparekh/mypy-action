#!/bin/bash
set -ax

mypy_args=""

# mypy output file
output_file=/tmp/mypy.out

lint_path=${1:-.}
mypy_version=$2
mypy_config_file=$3
flags=$4
requirements=$5
requirements_files=$6

# install specified mypy version, if defined else install latest
if [ ! -z "$mypy_version" ]; then
  pip install mypy==${mypy_version}
else
  pip install mypy
fi

# install requirements, if defined
if [ ! -z "$requirements" ]; then
    pip install $requirements
fi

if [ -n "$requirements_files" ]; then
    for file in $requirements_files; do
        pip install -r "$file"
    done
fi

# get mypy version
mypy --version

# concat mypy config file if provided
if [ ! -z "$mypy_config_file" ]; then
  mypy_args+=" --config-file=${mypy_config_file}"
fi

# concat mypy flags if provided
if [ ! -z "$flags" ]; then
  mypy_args += " $flags"
fi

# run mypy, tee output to file
# shellcheck disable=2086
mypy --show-column-numbers --hide-error-context ${mypy_args} ${lint_path} | tee "${output_file}"
exit_code="${PIPESTATUS[0]}"

# analyze output
python /github.py "${output_file}"

exit "$exit_code"
