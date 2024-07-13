FROM python:3.12-slim

# Устанавливаем переменные среды для Python и Poetry
ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_CACHE_DIR='/var/cache/pypoetry' \
    POETRY_HOME='/usr/local'\
    POETRY_VERSION=1.7.1

# Установка зависимостей
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean

# Установка Poetry через curl
RUN curl -sSL https://install.python-poetry.org | python3 -

# Установка python-dotenv для загрузки переменных среды из .env
RUN pip install python-dotenv

# Копирование только файлов с зависимостями для кэширования в слое Docker
WORKDIR /code
COPY poetry.lock pyproject.toml /code/

# Инициализация проекта:
RUN poetry install --no-interaction --no-ansi

# Копирование всех файлов проекта:
COPY . /code


# Установка рабочей директории
WORKDIR /code

# Открытие порта для приложения
EXPOSE 81

# Команда запуска приложения
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "81"]
