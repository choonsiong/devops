FROM ubuntu

# https://github.com/prometheus/pushgateway/releases/download/v1.11.0/pushgateway-1.11.0.linux-arm64.tar.gz

ENV PUSH_GATEWAY_ARCH=linux-arm64
ENV PUSH_GATEWAY_VERSION=1.11.0

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/prometheus/pushgateway/releases/download/v${PUSH_GATEWAY_VERSION}/pushgateway-${PUSH_GATEWAY_VERSION}.${PUSH_GATEWAY_ARCH}.tar.gz && \
    tar zxf pushgateway-${PUSH_GATEWAY_VERSION}.${PUSH_GATEWAY_ARCH}.tar.gz && \
    cd pushgateway-${PUSH_GATEWAY_VERSION}.${PUSH_GATEWAY_ARCH} && \
    mv pushgateway /usr/local/bin/

EXPOSE 9091

CMD [ "/usr/local/bin/pushgateway" ]