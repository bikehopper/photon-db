#!/bin/bash

# Usage: ./minio-upload my-bucket /prefix my-file.zip

bucket=$1
prefix=$2
file=$3

# minio.staging.svc.cluster.local
host=$MINIO_HOST
s3_key=$ACCESS_KEY
s3_secret=$SECRET_KEY

resource="/${bucket}${prefix}/${file}"
content_type="application/octet-stream"
date=`date -R`
_signature="PUT\n\n${content_type}\n${date}\n${resource}"
signature=`echo -en ${_signature} | openssl sha1 -hmac ${s3_secret} -binary | base64`

curl -X PUT -T "${file}" \
          -H "Host: ${host}" \
          -H "Date: ${date}" \
          -H "Content-Type: ${content_type}" \
          -H "Authorization: AWS ${s3_key}:${signature}" \
          http://${host}${resource}
