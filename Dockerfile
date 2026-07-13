FROM node:22 AS web

WORKDIR /app
COPY . .

RUN cd web-client && npm install --no-audit --no-fund && npm run build

FROM golang:1.24

WORKDIR /app
COPY . .
COPY --from=web /app/web-client/dist/public ./bin/web-client

RUN go mod tidy
RUN go build -o bin/mmb-server ./cmd/mmb-server

EXPOSE 3000

CMD ["./bin/mmb-server"]
