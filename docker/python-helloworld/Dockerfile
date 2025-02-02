FROM python:3

RUN apt-get update && apt-get install -y tzdata && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

ENV TZ="Asia/Tokyo"

COPY server.py /src/

USER www-data

CMD ["python", "/src/server.py"]