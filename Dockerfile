FROM node:20-alpine AS build
WORKDIR /app

RUN apk add --no-cache libc6-compat

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM joseluisq/static-web-server:2
WORKDIR /public

COPY --from=build /app/dist .
ENV SERVER_PORT=80
ENV SERVER_ROOT=/public