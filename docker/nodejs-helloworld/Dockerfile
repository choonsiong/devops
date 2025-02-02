FROM node:16

RUN apt-get update && apt-get install -y tzdata && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

ENV TZ="Asia/Tokyo"

COPY server.js /src/

USER node

CMD ["node", "/src/server.js"]