# FROM node:17-alpine as builder
FROM node:18.15-bullseye as builder
# Встановлення Eleventy
RUN npm install -g @11ty/eleventy --unsafe-perm

RUN mkdir -p /app
WORKDIR /app

COPY . /app/
RUN npm install

FROM builder

COPY . /app/

RUN npm run build

WORKDIR /app/dist

EXPOSE 8091

CMD [ "npx", "@11ty/eleventy", "--serve", "--port=8091" ]
