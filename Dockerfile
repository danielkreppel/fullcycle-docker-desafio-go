FROM golang:alpine AS build

RUN mkdir /app
ADD . /app
WORKDIR /app

RUN CGO_ENABLED=0 GOOS=linux go build -o /app Fullcycle-Rocks.go

FROM scratch AS production

COPY --from=build /app .

ENTRYPOINT ["./Fullcycle-Rocks"]