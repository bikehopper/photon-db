#!/bin/sh

./minio-download.sh $BUCKET_NAME /elasticsearch/photon_data.tar.gz ./photon_data.tar.gz

tar -xvzf photon_data.tar.gz -C ./photon_data

java -jar ./photon-*.jar
