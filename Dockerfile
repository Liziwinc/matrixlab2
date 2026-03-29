FROM ubuntu:24.04

RUN apt-get update \
    && rm -rf /var/lib/apt/lists/*

COPY matrix-task_1.0.deb /tmp/

RUN dpkg -i /tmp/matrix-task_1.0.deb || apt-get install -f -y && dpkg -i /tmp/matrix-task_1.0.deb

RUN rm /tmp/*.deb

RUN echo "2\n1\n2\n3\n-1" > /tmp/input.txt

CMD ["sh", "-c", "matrix_task < /tmp/input.txt"]