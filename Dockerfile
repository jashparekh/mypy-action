FROM python:3.10-alpine

LABEL "maintainer"="Jash Parekh <me@jashparekh.com>"

ADD entrypoint.sh /entrypoint.sh
ADD github.py /github.py

RUN apk add bash gcc musl-dev

ENTRYPOINT ["/entrypoint.sh"]
