FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM joseluisq/static-web-server:2
WORKDIR /public

COPY --from=build /app/dist .
ENV SERVER_PORT=8080
ENV SERVER_ROOT=/public