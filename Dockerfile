# Базовый образ – используем конкретную версию Ubuntu для совместимости
FROM ubuntu:24.04

# Установка зависимостей, если они нужны (например, для работы вашей программы)
RUN apt-get update && apt-get install -y \
    # здесь можно добавить зависимости, например libc6, libstdc++6 и т.д.
    && rm -rf /var/lib/apt/lists/*

# Копируем .deb-пакет (он будет передан в контекст сборки)
COPY matrix-task_1.0.deb /tmp/

# Устанавливаем пакет. Если есть зависимости, dpkg -i может провалиться, поэтому используем apt-get -f install
RUN dpkg -i /tmp/matrix-task_1.0.deb || apt-get install -f -y && dpkg -i /tmp/matrix-task_1.0.deb

# Удаляем временный файл
RUN rm /tmp/*.deb

# Создаём тестовый входной файл (как в вашем test_script.sh)
RUN echo "2\n1\n2\n3\n-1" > /tmp/input.txt

# Запускаем ваше приложение, перенаправляя stdin из файла.
# Выходной код программы будет возвращён как код завершения контейнера.
CMD ["sh", "-c", "matrix_task < /tmp/input.txt"]