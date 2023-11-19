FROM node:20.9.0-alpine3.18

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

RUN npm run test

RUN rm -rf tests && rm -rf node_modules

RUN npm install --production

CMD [ "npm", "run", "start:dev" ]
