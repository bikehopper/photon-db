#!/bin/sh
set -e

AWS_ACCESS_KEY_ID=$ACCESS_KEY AWS_SECRET_ACCESS_KEY=$SECRET_KEY aws s3api get-object --endpoint-url http://$MINIO_HOST.staging --bucket $BUCKET_NAME --key elasticsearch/photon_data.tar.gz photon_data.tar.gz

tar -xvzf photon_data.tar.gz

java -jar ./photon-*.jar -host nominatim-app-svc.staging -port 5432 -database nominatim -user nominatim -password $NOMINATIM_PASSWORD
