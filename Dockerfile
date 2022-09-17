FROM python:3.9.14 AS base

ENV PYTHONUNBUFFERED 1
ENV POETRY_HOME=/etc/poetry
ENV POETRY_VIRTUALENVS_IN_PROJECT=true
ENV WORKDIR /usr/src/app
ENV VENV_PATH="$WORKDIR/.venv"
ENV PATH="$POETRY_HOME/bin:$VENV_PATH/bin:$PATH"

WORKDIR ${WORKDIR}

FROM base AS python-build

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        curl \
        build-essential

ENV POETRY_VERSION=1.2.0
RUN curl -sSL https://install.python-poetry.org | python3 -

COPY poetry.lock pyproject.toml ./

RUN poetry install --no-root --no-dev

FROM base AS dev

COPY --from=python-build $POETRY_HOME $POETRY_HOME
COPY --from=python-build $WORKDIR $WORKDIR

RUN poetry install

COPY . .

ADD ./entrypoint.sh ./

ENTRYPOINT ["sh","./entrypoint.sh" ]

FROM base AS debug

RUN pip3 install debugpy

ENTRYPOINT ["python", "-m", "debugpy", "--listen", "0.0.0.0:5678", "--wait-for-client", "-m", "unittest"]
