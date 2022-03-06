#!/bin/sh
set -eu
# java -jar ./photon-*.jar -nominatim-import -host nominatim-app-svc.$POD_NAMESPACE -port 5432 -database nominatim -user nominatim -password $NOMINATIM_PASSWORD

mkdir -p ./photon_data
touch ./photon_data/test1.txt
echo 'Hello Andy' >> ./photon_data/test1.txt

tar -zvcf "photon_data.tar.gz" ./photon_data

AWS_ACCESS_KEY_ID=$ACCESS_KEY AWS_SECRET_ACCESS_KEY=$SECRET_KEY aws s3api put-object --endpoint-url http://$MINIO_HOST.$POD_NAMESPACE --bucket $BUCKET_NAME --key elasticsearch/photon_data.tar.gz --body photon_data.tar.gz
