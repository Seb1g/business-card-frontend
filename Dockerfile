FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM joseluisq/static-web-server:2
WORKDIR /public

COPY --from=build /app/dist .
ENV SERVER_PORT=80
ENV SERVER_ROOT=/public