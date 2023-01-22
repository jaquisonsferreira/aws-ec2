FROM node:16-alpine as builder

RUN apk add --no-cache git

WORKDIR /app

RUN apk update && apk upgrade
RUN apk add python3 g++ make

COPY package*.json ./
COPY prisma ./prisma/

RUN yarn

COPY . .

RUN yarn build

EXPOSE 3000

CMD [ "node", "dist/src/main.js" ]