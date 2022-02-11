#!/bin/sh

echo "[$(date -u +'%Y-%m-%dT%H:%M:%SZ')] Fetching photon-db...";
curl -J "http://graphhopper-data-proxy-svc.$POD_NAMESPACE.svc.cluster.local/download1_graphhopper$DOWNLOADS_GRAPHHOPPER_PATH" -o $DOWNLOADS_GRAPHHOPPER_FILE_NAME --silent
echo "[$(date -u +'%Y-%m-%dT%H:%M:%SZ')] Finished downloading photon-db.";

echo "[$(date -u +'%Y-%m-%dT%H:%M:%SZ')] Decompressing photon-db...";
bzip2 -cd $DOWNLOADS_GRAPHHOPPER_FILE_NAME | tar x
echo "[$(date -u +'%Y-%m-%dT%H:%M:%SZ')] Finished decompressing photon-db.";

java -jar ./photon-*.jar -nominatim-import -host nominatim-svc.$POD_NAMESPACE.svc.cluster.local -port 5432 -database nominatim -user nominatim -password $NOMINATIM_PASSWORD

java -jar ./photon-*.jar -host nominatim-svc.$POD_NAMESPACE.svc.cluster.local -port 5432 -database nominatim -user nominatim -password $NOMINATIM_PASSWORD

