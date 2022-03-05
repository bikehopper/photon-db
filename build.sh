#!/bin/sh
datetime=$(date +%FT%T)

java -jar ./photon-*.jar -nominatim-import -host nominatim-app-svc.$POD_NAMESPACE -port 5432 -database nominatim -user nominatim -password $NOMINATIM_PASSWORD

tar -zcf "${datetime}#photon_data.tar.gz" ./photon_data

./minio-upload bikehopper_photon /elasticsearch "${datetime}#photon_data.tar.gz"
