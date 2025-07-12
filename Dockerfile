FROM node:20 AS build
WORKDIR /app
COPY . .
RUN npm ci
RUN npm run build

FROM node:20 AS prod
WORKDIR /app
RUN npm install -g serve
COPY --from=build /app/build ./build

EXPOSE 4100

CMD ["serve", "-s", "build", "-l", "4100"]
