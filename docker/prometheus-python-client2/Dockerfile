FROM ubuntu

RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-prometheus-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY main.py .

CMD [ "python3", "/app/main.py" ]