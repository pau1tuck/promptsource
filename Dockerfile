FROM alpine:latest

RUN apk update &&
    apk add python3=3.7.12-r0 &&
    apk add --no-cache --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ \
        bash curl wget vim nano ca-certificates &&
    apk add --no-cache --virtual .build-deps gcc python3-dev musl-dev &&
    python3 -m ensurepip &&
    rm -r /usr/lib/python*/ensurepip &&
    pip3 install --upgrade pip setuptools &&
    rm -r /root/.cache

CMD ["python3"]
