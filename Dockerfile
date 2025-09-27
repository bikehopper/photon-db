FROM mediagis/nominatim:5.1

RUN sh /app/start.sh

# used to unzip photon-db
RUN apt-get update \
  && apt-get install -y default-jre dumb-init \
  && mkdir -p /usr/app

# get photon jar file
RUN curl -fsSLJ https://github.com/komoot/photon/releases/download/0.7.4/photon-opensearch-0.7.4.jar -o photon-opensearch-0.7.4.jar --silent
RUN java -jar photon-*.jar -nominatim-import -host localhost -port 5432 -database nominatim -user nominatim -password $NOMINATIM_PASSWORD
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
