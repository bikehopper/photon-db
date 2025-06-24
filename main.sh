#!/bin/sh
set -e

if [ -z "$(ls -A ./photon_data | grep -v .gitkeep)" ]; then # if empty photon_data dir
  echo "Downloading photon_data tarball..."
  AWS_ACCESS_KEY_ID=$ACCESS_KEY AWS_SECRET_ACCESS_KEY=$SECRET_KEY aws s3api get-object --endpoint-url $MINIO_HOST --bucket $BUCKET_NAME --key $PHOTON_DATABASE_KEY photon_data.tgz
  echo "Downloaded photon_data tarball."
  echo "Decompressing photon_data tarball..."
  tar -xzf photon_data.tgz
  echo "Decompressed photon_data tarball."
fi

echo "Starting photon..."

exec java -jar ./photon-*.jar
