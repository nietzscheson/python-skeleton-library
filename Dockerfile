FROM python:3.9 AS base

ENV PYTHONUNBUFFERED 1

RUN pip3 install --upgrade pip pipenv

WORKDIR /usr/src/app

ADD ./setup.py ./Pipfile* ./

RUN pip3 install -e .

RUN pipenv lock

RUN pipenv install --system --deploy --dev

FROM base AS dev

ADD ./entrypoint.sh ./

ENTRYPOINT ["sh","./entrypoint.sh" ]

FROM base AS debug

RUN pip3 install debugpy

ENTRYPOINT ["python", "-m", "debugpy", "--listen", "0.0.0.0:5678", "--wait-for-client", "-m", "unittest"]
