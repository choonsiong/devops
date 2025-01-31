FROM ubuntu:20.04

LABEL maintainer "foo@example.com"
LABEL description "A simple web server"

# Set environment variables and timezone
# (saves interactive queries)
ENV TIMEZONE="Asia/Tokyo" \
    APACHE_RUN_USER=www-data \
    APACHE_RUN_GROUP=www-data \
    APACHE_LOG_DIR=/var/log/apache2

# Set timezone, install apache, remove unnecessary files from
# package cache immediately, enable HTTPS
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get update && \
    apt-get install -y apache2 && \
    apt-get -y clean && \
    rm -r /var/cache/apt /var/lib/apt/lists/* && \
    a2ensite default-ssl && \
    a2enmod ssl

# Release ports 80 and 443
EXPOSE 80 443

# Volumes available for local mount
VOLUME [ "/var/www/html", "/var/log/apache2" ]

# Copy entire content of project directory samplesite
# to /var/www/html
COPY samplesite/ /var/www/html

# Start command
CMD ["/usr/bin/apache2ctl", "-D", "FOREGROUND"]