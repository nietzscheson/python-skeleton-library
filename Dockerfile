FROM python:3.9.14 AS base

ENV PYTHONUNBUFFERED 1

RUN pip3 install --upgrade pip pipenv poetry==1.2.0

WORKDIR /usr/src/app

COPY poetry.lock pyproject.toml ./

RUN poetry config virtualenvs.create false

RUN poetry install --no-root --no-dev

FROM base AS dev

RUN poetry install

ADD ./entrypoint.sh ./

ENTRYPOINT ["sh","./entrypoint.sh" ]

FROM base AS debug

RUN pip3 install debugpy

ENTRYPOINT ["python", "-m", "debugpy", "--listen", "0.0.0.0:5678", "--wait-for-client", "-m", "unittest"]
