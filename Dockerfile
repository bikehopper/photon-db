FROM openjdk:19-jdk-alpine3.15

# used to unzip photon-db
RUN apk update \
  && apk add aws-cli curl \
  && mkdir -p /usr/app

# copy startup script
COPY ./main.sh /usr/app

WORKDIR /usr/app

# get photon jar file
RUN curl -LJ https://github.com/komoot/photon/releases/download/0.3.5/photon-0.3.5.jar -o /usr/app/photon-0.3.5.jar --silent

ENTRYPOINT [ "/usr/app/main.sh" ]
