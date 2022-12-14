#!/bin/sh
set -eu

java -jar ./photon-*.jar -nominatim-import -host nominatim-app-svc.$POD_NAMESPACE -port 5432 -database nominatim -user nominatim -password $NOMINATIM_PASSWORD

tar -zvcf "photon_data.tar.gz" ./photon_data
