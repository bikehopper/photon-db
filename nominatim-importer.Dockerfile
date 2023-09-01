FROM amazoncorretto:20-alpine3.18

# used to unzip photon-db
RUN apk update \
  && apk add aws-cli curl pigz \
  && mkdir -p /usr/app

# copy startup script
COPY ./build.sh /usr/app

WORKDIR /usr/app

# get photon jar file
RUN curl -fsSLJ https://github.com/komoot/photon/releases/download/0.4.3/photon-0.4.3.jar -o /usr/app/photon-0.4.3.jar --silent

ENTRYPOINT [ "/usr/app/build.sh" ]
