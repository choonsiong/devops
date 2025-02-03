FROM ubuntu

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        subversion \
        joe \
        vim \
        less && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD [ "/bin/bash" ]