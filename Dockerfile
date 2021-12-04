ARG python_version=${python_version:-"python_version NOT SET"}
ARG mypy_version=${mypy_version:-"python_version NOT SET"}

FROM python:${python_version}-slim-buster

LABEL "maintainer"="Jash Parekh <jash389@gmail.com>"

ADD entrypoint.sh /entrypoint.sh
#ADD github.py /github.py

RUN apk add bash gcc musl-dev && \
    pip install mypy==${mypy_version}

ENTRYPOINT ["/entrypoint.sh"]
