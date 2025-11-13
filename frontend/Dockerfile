# Builder 

FROM node:22-alpine AS builder 

WORKDIR /app 

COPY package.json yarn.lock ./ 

RUN yarn install 

COPY . . 

RUN yarn build 

# Using a lightweight nginx version of node to serve the built js files 

FROM nginx:alpine 


COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 7070
