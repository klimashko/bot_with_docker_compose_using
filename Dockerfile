# Simple build
FROM python:3.11-slim-bullseye
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache -r /app/requirements.txt
COPY bot_with_docker_compose_using /app/bot_with_docker_compose_using
CMD ["python", "-m", "bot_with_docker_compose_using"]