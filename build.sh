#!/bin/sh
set -eu

exec java -jar ./photon-*.jar -nominatim-import -host $NOMINATIM_HOST -port $NOMINATIM_PORT -database nominatim -user nominatim -password $NOMINATIM_PASSWORD
