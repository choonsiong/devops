# This will setup the prometheus node exporter on an redhat container.
# https://prometheus.io/download/#node_exporter

FROM ubuntu

ENV ALERT_MANAGER_ARCH=linux-arm64
ENV ALERT_MANAGER_VERSION=0.28.0

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# https://github.com/prometheus/alertmanager/releases/download/v0.28.0/alertmanager-0.28.0.linux-arm64.tar.gz

RUN wget https://github.com/prometheus/alertmanager/releases/download/v${ALERT_MANAGER_VERSION}/alertmanager-${ALERT_MANAGER_VERSION}.${ALERT_MANAGER_ARCH}.tar.gz && \
    tar zxf alertmanager-${ALERT_MANAGER_VERSION}.${ALERT_MANAGER_ARCH}.tar.gz && \
    cd alertmanager-${ALERT_MANAGER_VERSION}.${ALERT_MANAGER_ARCH} && \
    mv alertmanager amtool /usr/local/bin/
    #mkdir -p /var/lib/alertmanager/data && \
    #mv * /var/lib/alertmanager/

VOLUME [ "/var/lib/alertmanager" ]

EXPOSE 9093

#CMD [ "/app/node_exporter-1.8.2.linux-amd64/node_exporter" ]
CMD [ "/usr/local/bin/alertmanager", "--config.file=/var/lib/alertmanager/alertmanager.yml", "--storage.path=/var/lib/alertmanager/data" ]