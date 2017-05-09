FROM node:7.10.0

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app
RUN sudo npm install

COPY . /usr/src/app

EXPOSE 8080

CMD ["npm", "start"]