FROM python:3

ENV TIMEZONE="Asia/Tokyo"
ENV PROMTAIL_ARCH=linux-arm64
ENV PROMTAIL_VERSION=3.4.2

WORKDIR /app

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install wget unzip tzdata && \
    apt-get clean && \
    rm -r /var/cache/apt /var/lib/apt/lists/* && \
    ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
    echo $TIMEZONE > /etc/timezone

COPY app.py .

COPY promtail_config.yml .
    
RUN wget https://github.com/grafana/loki/releases/download/v${PROMTAIL_VERSION}/promtail-${PROMTAIL_ARCH}.zip && \
    unzip promtail-${PROMTAIL_ARCH}.zip && \
    mv promtail-${PROMTAIL_ARCH} /usr/local/bin/promtail && \
    mkdir -p /etc/promtail/config && \
    mv /app/promtail_config.yml /etc/promtail/config/config.yml

CMD [ "/usr/local/bin/promtail", "-config.file=/etc/promtail/config/config.yml" ]