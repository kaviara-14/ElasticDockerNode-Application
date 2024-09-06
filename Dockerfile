FROM node:22-alpine

COPY package.json /app/
COPY server.js /app/

WORKDIR /app

RUN npm install

CMD [ "node", "server.js"]