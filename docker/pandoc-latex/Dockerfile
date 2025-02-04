FROM ubuntu:20.04

# Install packages
ENV TZ="Asia/Tokyo"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

RUN apt-get update -y && \
    apt-get install -y -o Acquire::Retries=10 --no-install-recommends \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-pstricks \
    texlive-fonts-extra \
    imagemagick \
    unzip \
    python3 \
    ghostscript \
    locales \
    joe \
    vim \
    curl \
    wget \
    ca-certificates \
    less && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install pandoc
RUN curl -L https://github.com/jgm/pandoc/releases/download/3.6.2/pandoc-3.6.2-1-arm64.deb \
    -o /tmp/pandoc.deb && \
    dpkg -i /tmp/pandoc.deb && \
    rm /tmp/pandoc.deb

# Install fonts (ADD will unarchive automatically)
ADD myfonts.tgz /usr/local/share/texmf
RUN texhash

# Connect volume /data for docker run with the working directory,
# so: docker run -v $(pwd):/data
# Fedora, RHEL: docker run -v $(pwd):/data:z
VOLUME [ "/data" ]

# Start command
ENTRYPOINT [ "/bin/bash" ]