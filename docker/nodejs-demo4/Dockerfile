# We specify amd64 so we can run the container on x64 ec2 instance
FROM --platform=linux/amd64 node:14-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

CMD ["node", "app.js"]