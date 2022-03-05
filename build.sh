#!/bin/sh

java -jar ./photon-*.jar -nominatim-import -host nominatim-app-svc.$POD_NAMESPACE -port 5432 -database nominatim -user nominatim -password $NOMINATIM_PASSWORD

tar -zcf "photon_data.tar.gz" ./photon_data

./minio-upload $BUCKET_NAME /elasticsearch/photon_data.tar.gz
