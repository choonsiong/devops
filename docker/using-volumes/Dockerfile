FROM ubuntu:20.04

LABEL maintainer "foobar@example.com"

RUN apt-get update && \
    apt-get install -y iputils-ping tree vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/root"]

CMD ["/bin/bash"]