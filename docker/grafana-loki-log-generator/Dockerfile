FROM python:3

ENV TIMEZONE="Asia/Tokyo"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install tzdata && \
    apt-get clean && \
    rm -r /var/cache/apt /var/lib/apt/lists/* && \
    ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
    echo $TIMEZONE > /etc/timezone

WORKDIR /app

COPY loggen.py .

CMD [ "/bin/bash" ]