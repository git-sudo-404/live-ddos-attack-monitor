# Multi-Stage Dockerfile for a Node.js application
# How does it work ? 
# -> First it install all the dependencies and build the application in a builder stage.
# -> Then it runs the yarn build to get the build output.(or dist files).
# -> Then use this build file to run the application in a production stage.
# -> So that now the container size is significantly smaller


# ------- Stage - 1 --------- builder 

FROM node:22-alpine3.22 AS builder 
WORKDIR /app 
COPY package.json yarn.lock tsconfig.json ./ 
RUN yarn install 
COPY . .
RUN yarn build 




# ------ Stage - 2 -------- Production 

FROM node:22-alpine3.22
WORKDIR /app 
COPY --from=builder /app/package.json /app/yarn.lock ./ 
RUN yarn install --production 
COPY --from=builder /app/build ./build 
EXPOSE 8080
CMD ["yarn", "start"]
