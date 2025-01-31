FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

ARG DEFAULT_PORT=80

ENV PORT=${DEFAULT_PORT}

# anonymous volume, only exists when container exists (if use --rm option)
#VOLUME [ "/app/feedback" ]
# we cannot create a named volume or bind mount inside docker file!

EXPOSE ${PORT}

#CMD [ "node", "server.js" ]
CMD [ "npm", "start" ]

# docker run -d --name feedback-app --rm -p 3000:80 -v feedback-app:/app/feedback -v $(pwd):/app -v /app/node_modules feedback-node
# docker run -d --name feedback-app --rm -p 3000:80 -v feedback-app:/app/feedback -v "$(pwd):/app:ro"  -v /app/node_modules -v /app/temp feedback-app
# docker run -d --name feedback-app --rm -p 3000:8800 --env PORT=8800 -v feedback-app:/app/feedback -v $(pwd):/app:ro  -v /app/node_modules -v /app/temp feedback-app
# docker run -d --name feedback-app --rm -p 3000:8000 --env-file ./.env -v feedback-app:/app/feedback -v $(pwd):/app:ro  -v /app/node_modules -v /app/temp feedback-app