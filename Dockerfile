FROM python:3.10-alpine

LABEL "maintainer"="Jash Parekh <jash389@gmail.com>"

ADD entrypoint.sh /entrypoint.sh

RUN apk add bash gcc musl-dev

ENTRYPOINT ["/entrypoint.sh"]
