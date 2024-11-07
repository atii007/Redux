
FROM node:alpine

WORKDIR /app

COPY package*.json ./

RUN npm install 

ENV NEW_RELIC_NO_CONFIG_FILE=true
ENV NEW_RELIC_DISTRIBUTED_TRACING_ENABLED=true
ENV NEW_RELIC_LOG=stdout

COPY . .

RUN npm run build

EXPOSE 8000

CMD ["npm", "start"]