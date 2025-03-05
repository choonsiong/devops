FROM python:3

ENV TIMEZONE="Asia/Tokyo"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install tzdata && \
    apt-get clean && \
    rm -r /var/cache/apt /var/lib/apt/lists/* && \
    ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
    echo $TIMEZONE > /etc/timezone

WORKDIR /app

# The original intention is to run the python program with promtail setup so
# that the log generated inside the container can be use on grafana on the same
# network, but this is not complete yet
COPY loggen.py .

CMD [ "/bin/bash" ]