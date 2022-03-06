#!/bin/sh

AWS_ACCESS_KEY_ID=$ACCESS_KEY AWS_SECRET_ACCESS_KEY=$SECRET_KEY aws s3api get-object --endpoint-url http://$MINIO_HOST.$POD_NAMESPACE --bucket $BUCKET_NAME --key elasticsearch/photon_data.tar.gz photon_data.tar.gz

tar -xvzf photon_data.tar.gz

java -jar ./photon-*.jar
