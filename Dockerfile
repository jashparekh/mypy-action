ARG python_version=3.9

FROM python:$python_version

LABEL "maintainer"="Jash Parekh <me@jashparekh.com>"

ADD entrypoint.sh /entrypoint.sh
ADD github.py /github.py

RUN apt-get update && apt-get install -y \
    bash gcc musl-dev \
    && rm -rf /var/lib/apt/lists/* \
    && pip install -U pip

ENTRYPOINT ["/entrypoint.sh"]
