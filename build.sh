#!/bin/sh
set -eu

java -jar ./photon-*.jar -nominatim-import -host nominatim-app-svc.$POD_NAMESPACE -port 5432 -database nominatim -user nominatim -password $NOMINATIM_PASSWORD

tar --use-compress-program="pigz -k -9" -zcf "photon_data.tar.gz" ./photon_data
