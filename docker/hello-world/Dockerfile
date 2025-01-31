FROM ubuntu

# Specifying specific package version
RUN apt-get update && apt-get install -y \
    package1 \
    package2 \
    package3=1.2.3 \
    && rm -rf /var/lib/apt/lists/*

# Using EVN
ENV PG_MAJOR 1.2
ENV PG_VERSION 1.2.1
RUN curl -SL http://xxxx.com/postgres-${PG_VERSION}.tar.gz | tar -xjc /usr/src/postgres && ENV PATH /usr/local/postgres-${PG_MAJOR}/bin:$PATH

CMD ["/bin/bash"]