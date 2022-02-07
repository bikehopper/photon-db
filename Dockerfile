FROM openjdk:19-jdk-alpine3.15

# used to unzip photon-db
RUN apk add bzip2

# copy startup script
COPY ./main.sh /usr/app

# get photon jar file
ADD https://github.com/komoot/photon/releases/download/0.3.5/photon-0.3.5.jar /usr/app/photon-0.3.5.jar

ENTRYPOINT [ "/usr/app/main.sh" ]
