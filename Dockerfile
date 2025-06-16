# Simple build
FROM python:3.11-slim-bullseye
# Устанавливаем переменные окружения
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
# Рабочая директория в контейнере
WORKDIR /app
# Копируем зависимости и устанавливаем их
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# Копируем весь проект
COPY .. /app
# Запускаем пакет как модуль (тк в нем есть __main__.py)
CMD ["python", "-m", "bot_with_docker_compose_using"]
