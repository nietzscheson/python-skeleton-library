FROM python:3.8-alpine

RUN apk add --no-cache --virtual .build-deps \
    bash \
    && rm -rf /var/cache/apk/*

ENV PYTHONUNBUFFERED 1

WORKDIR /usr/src/app

COPY setup.py .

RUN pip3 install tox debugpy -e . 

COPY . .

# ENTRYPOINT ["python", "-m", "debugpy", "--listen", "0.0.0.0:5678", "--wait-for-client", "-m", "unittest"]