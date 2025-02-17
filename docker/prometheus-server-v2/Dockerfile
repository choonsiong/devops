FROM ubuntu:20.04

LABEL maintainer "maintainer@example.com"

ENV PROMETHEUS_ARCH=linux-arm64
ENV PROMETHEUS_VERSION=2.53.3

RUN apt-get update && \
    apt-get install -y iproute2 iputils-ping tree vim wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd --system prometheus && \
    useradd -s /sbin/nologin --system -g prometheus prometheus && \
    mkdir -p /etc/prometheus/rules && \
    mkdir -p /etc/prometheus/rules.s && \
    mkdir -p /etc/prometheus/files_sd && \
    mkdir -p /var/lib/prometheus

WORKDIR /root

VOLUME [ "/etc/prometheus", "/var/lib/prometheus" ]

#COPY prometheus.service .

#RUN mv prometheus.service /etc/systemd/system/prometheus.service

# https://github.com/prometheus/prometheus/releases/download/v3.2.0-rc.1/prometheus-3.2.0-rc.1.linux-arm64.tar.gz
# https://github.com/prometheus/prometheus/releases/download/v2.53.3/prometheus-2.53.3.linux-arm64.tar.gz

RUN wget https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.${PROMETHEUS_ARCH}.tar.gz && \
    tar zxf prometheus-${PROMETHEUS_VERSION}.${PROMETHEUS_ARCH}.tar.gz && \
    cd prometheus-${PROMETHEUS_VERSION}.${PROMETHEUS_ARCH} && \
    mv prometheus promtool /usr/local/bin/ && \
    mv prometheus.yml /etc/prometheus/prometheus.yml

RUN chown -R prometheus:prometheus /etc/prometheus && \
    chmod -R 775 /etc/prometheus && \
    chown -R prometheus:prometheus /var/lib/prometheus
    # systemctl daemon-reload && \    
    # systemctl start prometheus && \
    # systemctl enable prometheus

EXPOSE 9090

CMD [ "/usr/local/bin/prometheus", "--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/var/lib/prometheus", "--web.console.templates=/etc/prometheus/consoles", "--web.console.libraries=/etc/prometheus/console_libraries", "--web.listen-address=0.0.0.0:9090", "--web.external-url=" ]