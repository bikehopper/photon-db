#!/bin/sh
set -e

AWS_ACCESS_KEY_ID=$ACCESS_KEY AWS_SECRET_ACCESS_KEY=$SECRET_KEY aws s3api get-object --endpoint-url $MINIO_HOST --bucket $BUCKET_NAME --key elasticsearch/photon_data.tar.gz photon_data.tar.gz

tar -xvzf photon_data.tar.gz

java -jar ./photon-*.jar
