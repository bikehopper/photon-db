#!/bin/sh
set -eu
# java -jar ./photon-*.jar -nominatim-import -host nominatim-app-svc.$POD_NAMESPACE -port 5432 -database nominatim -user nominatim -password $NOMINATIM_PASSWORD

mkdir -p ./photon_data
touch ./photon_data/test1.txt
echo 'Hello Andy' >> ./photon_data/test1.txt

tar -zvcf "photon_data.tar.gz" ./photon_data
echo 'ls /bin...'
ls /bin
echo 'ls ./...'
ls -halt
./minio-upload.sh $BUCKET_NAME /elasticsearch photon_data.tar.gz
