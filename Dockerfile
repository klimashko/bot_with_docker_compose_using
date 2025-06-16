# Simple build
FROM python:3.11-slim-bullseye
# Не создавай .pyc файлы
ENV PYTHONDONTWRITEBYTECODE=1
# Вывод сразу идет в консоль (без буфера)
ENV PYTHONUNBUFFERED=1
# Рабочая директория в контейнере
WORKDIR /app
# Копируем зависимости
COPY requirements.txt .
# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt
# Копируем сам проект (только папку bot)# Запускаем пакет как модуль (тк в нем есть __main__.py)
COPY bot /app/bot
# Запуск проекта как python -m bot
CMD ["python", "-m", "bot"]
