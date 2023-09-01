FROM eclipse-temurin:17-jre-jammy

# used to unzip photon-db
RUN apt-get update \
  && apt-get install -y awscli curl pigz \
  && mkdir -p /usr/app

# copy startup script
COPY ./main.sh /usr/app

WORKDIR /usr/app

# get photon jar file
RUN curl -fsSLJ https://github.com/komoot/photon/releases/download/0.4.3/photon-0.4.3.jar -o /usr/app/photon-0.4.3.jar --silent

ENTRYPOINT [ "/usr/app/main.sh" ]
