FROM eclipse-temurin:17-jre-jammy

# used to unzip photon-db
RUN apt-get update \
  && apt-get install -y awscli curl pigz dumb-init \
  && mkdir -p /usr/app

# copy startup script
COPY ./build.sh /usr/app

WORKDIR /usr/app

# get photon jar file
RUN curl -fsSLJ https://github.com/komoot/photon/releases/download/0.7.0/photon-opensearch-0.7.0.jar -o /usr/app/photon-opensearch-0.7.0.jar --silent
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD [ "/usr/app/build.sh" ]
