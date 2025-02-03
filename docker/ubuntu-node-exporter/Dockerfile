FROM ubuntu

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN wget https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz && \
    tar zxf node_exporter-1.8.2.linux-amd64.tar.gz

CMD [ "/app/node_exporter-1.8.2.linux-amd64/node_exporter" ]