#!/bin/bash

CONFIG_FILE=./transmission-wireguard.yml

if [[ $1 == "restart" ]]; then
  sudo docker-compose -f "${CONFIG_FILE}" down && sudo docker-compose -f "${CONFIG_FILE}" up -d
elif [[ $1 == "down" ]]; then
  sudo docker-compose -f "${CONFIG_FILE}" down
elif [[ $1 == "up" ]]; then
  sudo docker-compose -f "${CONFIG_FILE}" up -d
elif [[ $1 == "logs" ]]; then
  sudo docker logs config_transmission_1 -f
elif [[ $1 == "sh" ]]; then
  sudo docker exec -it config_transmission_1 bash
fi
