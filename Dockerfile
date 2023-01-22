FROM node:16-alpine3.16

WORKDIR /app

COPY package*.json yarn.lock ./

RUN yarn install


COPY . .

RUN yarn build

# CMD [ "node", "dist/src/main.js" ]

CMD [ "yarn", "start:prod" ]