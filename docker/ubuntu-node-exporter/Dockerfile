# This will setup the prometheus node exporter on an ubuntu container.
# Note that following image is of amd64 because node exporter does not contains
# arm64 linux version.
# https://prometheus.io/download/#node_exporter

FROM ubuntu

ENV NODE_EXPORTER_ARCH=linux-arm64
ENV NODE_EXPORTER_VERSION=1.8.2

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-arm64.tar.gz

RUN wget https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.${NODE_EXPORTER_ARCH}.tar.gz && \
    tar zxf node_exporter-${NODE_EXPORTER_VERSION}.${NODE_EXPORTER_ARCH}.tar.gz && \
    cd node_exporter-${NODE_EXPORTER_VERSION}.${NODE_EXPORTER_ARCH} && \
    mv node_exporter /usr/local/bin/

EXPOSE 9100

#CMD [ "/app/node_exporter-1.8.2.linux-amd64/node_exporter" ]
CMD [ "/usr/local/bin/node_exporter" ]