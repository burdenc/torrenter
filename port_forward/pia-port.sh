#!/bin/bash

trap 'exit 0' SIGTERM

OLDPORT=0
PORT=0

auth="$TRANSMISSION_USER:$TRANSMISSION_PASS" 

echo "Running port forward helper..."

while true
do
  [ -r "/pia-shared/port.dat" ] && PORT=$(cat /pia-shared/port.dat)

  if [ $OLDPORT -ne $PORT ]; then
    echo "Setting Transmission port settings ($PORT)..."
    transmission-remote "${TRANSMISSION_PORT}" --auth "${auth}" -p "${PORT}"
    echo "Testing port..."
    transmission-remote "${TRANSMISSION_PORT}" --auth "${auth}" -pt
    OLDPORT=$PORT
  fi
  sleep 10 &
  wait $!
done
