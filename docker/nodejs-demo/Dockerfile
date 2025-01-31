FROM node

# app will be created automatically
WORKDIR /app 

COPY . /app

RUN npm install

EXPOSE 80

# run when container start
CMD [ "node", "server.js" ]