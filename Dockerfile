# FROM openjdk:19-jdk-alpine3.15
FROM amazoncorretto:20-alpine3.18

# used to unzip photon-db
RUN apk update \
  && apk add aws-cli curl pigz \
  && mkdir -p /usr/app

# copy startup script
COPY ./main.sh /usr/app

WORKDIR /usr/app

# get photon jar file
RUN curl -LJ https://github.com/komoot/photon/releases/download/0.4.1/photon-0.4.3.jar -o /usr/app/photon-0.4.3.jar --silent

ENTRYPOINT [ "/usr/app/main.sh" ]
