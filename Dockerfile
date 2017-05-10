FROM node:7.10.0-alpine

RUN apk add --no-cache build-base

## cache node modules
ADD ./package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /app/src && cp -a /tmp/node_modules /app/

## copy meta
WORKDIR /app
ADD ./package.json /app/package.json

## build
WORKDIR /app
ADD ./src /app/src
ADD ./server.js /app/server.js
ADD ./.babelrc /app/.babelrc
ADD ./webpack.config.js /app/webpack.config.js
ADD ./config.js /app/config.js

WORKDIR /app

EXPOSE 8080

CMD ["npm", "start"]