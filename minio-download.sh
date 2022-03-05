#!/usr/bin/env sh

# Example: ./minio-download.sh bucket-name /minio/path/to/file.txt.zst /download/path/to/file.txt.zst

if [ -z $1 ]; then
  echo "You have NOT specified a BUCKET!"
  exit 1
fi

if [ -z $2 ]; then
  echo "You have NOT specified a MINIO FILE PATH!"
  exit 1
fi

if [ -z $3 ]; then
  echo "You have NOT specified a DOWNLOAD PATH!"
  exit 1
fi


# User Minio Vars
BUCKET=$1
MINIO_PATH="/${BUCKET}$2"
OUT_FILE=$3

# Static Vars
HOST="${MINIO_HOST}.${POD_NAMESPACE}:${MINIO_PORT}"
S3_KEY=$ACCESS_KEY
S3_SECRET=$SECRET_KEY
DATE=$(date -R --utc)
CONTENT_TYPE='application/zstd'
SIG_STRING="GET\n\n${CONTENT_TYPE}\n${DATE}\n${MINIO_PATH}"
SIGNATURE=`echo -en ${SIG_STRING} | openssl sha1 -hmac ${S3_SECRET} -binary | base64`


curl -o "${OUT_FILE}" \
    -H "Host: $HOST" \
    -H "Date: ${DATE}" \
    -H "Content-Type: ${CONTENT_TYPE}" \
    -H "Authorization: AWS ${S3_KEY}:${SIGNATURE}" \
    http://$HOST${MINIO_PATH}
