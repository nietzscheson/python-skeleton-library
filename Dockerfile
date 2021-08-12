FROM python:3.8 AS base

ENV PYTHONUNBUFFERED 1

WORKDIR /usr/src/app

COPY setup.py .

RUN pip3 install -e . 

FROM base AS dev

RUN pip3 install tox

FROM base AS debug

RUN pip3 install debugpy

ENTRYPOINT ["python", "-m", "debugpy", "--listen", "0.0.0.0:5678", "--wait-for-client", "-m", "unittest"]
