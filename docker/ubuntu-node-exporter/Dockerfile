# This will setup the prometheus node exporter on an ubuntu container.
# Note that following image is of amd64 because node exporter does not contains
# arm64 linux version.
# https://prometheus.io/download/#node_exporter

FROM ubuntu

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN wget https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz && \
    tar zxf node_exporter-1.8.2.linux-amd64.tar.gz

CMD [ "/app/node_exporter-1.8.2.linux-amd64/node_exporter" ]