FROM node:alpine as builder

WORKDIR app/

COPY package*.json /

RUN npm install 

COPY . .

RUN npm run build

FROM node:alpine as production

WORKDIR app/

COPY package*.json /

RUN npm install 

COPY ./dist /

RUN node src/index.js
