FROM node:20-alpine AS build
WORKDIR /app

RUN apk add --no-cache libc6-compat

COPY package*.json ./

RUN npm ci || npm install

COPY . .

RUN ls -la node_modules/.bin && npm run build

FROM joseluisq/static-web-server:2
WORKDIR /public

COPY --from=build /app/dist .
ENV SERVER_PORT=8080
ENV SERVER_ROOT=/public