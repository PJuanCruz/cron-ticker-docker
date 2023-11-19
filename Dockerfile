# DEV DEPENDENCIES
FROM node:20.9.0-alpine3.18 as dev-dependencies

WORKDIR /app

COPY package.json ./

RUN npm install

# BUILD & TESTS
FROM node:20.9.0-alpine3.18 as builder

WORKDIR /app

COPY --from=dev-dependencies /app/node_modules ./node_modules

COPY . .

RUN npm run test

# PROD DEPENDENCIES
FROM node:20.9.0-alpine3.18 as prod-dependencies

WORKDIR /app

COPY package.json ./

RUN npm install --production

# RUN START
FROM node:20.9.0-alpine3.18 as runner

WORKDIR /app

COPY --from=prod-dependencies /app/node_modules ./node_modules

COPY app.js ./

COPY tasks/ ./tasks

CMD [ "node", "./app.js" ]
