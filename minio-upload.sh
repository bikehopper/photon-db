#!/usr/bin/env sh
set -eu
# Usage: ./minio-upload my-bucket /prefix my-file_path.zip

bucket=$1
prefix=$2
file_path=$3

# minio.staging
host="${MINIO_HOST}.${POD_NAMESPACE}"
s3_key=$ACCESS_KEY
s3_secret=$SECRET_KEY

echo "host: ${host}"
echo "s3_key: ${s3_key}"
echo "s3_secret: ${s3_secret}"

resource="/${bucket}${prefix}/${file_path}"
content_type="application/octet-stream"
date=`date -R`
_signature="PUT\n\n${content_type}\n${date}\n${resource}"
signature=`echo -en ${_signature} | openssl sha1 -hmac ${s3_secret} -binary | base64`

echo "host: ${host}"
echo "s3_key: ${s3_key}"
echo "s3_secret: ${s3_secret}"
echo "resource: ${resource}"

curl --silent -v --fail-with-body -X PUT -T "${file_path}" \
          -H "Host: ${host}" \
          -H "Date: ${date}" \
          -H "Content-Type: ${content_type}" \
          -H "Authorization: AWS ${s3_key}:${signature}" \
          http://${host}${resource}
