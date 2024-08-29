#!/bin/bash

while true; do
    /docker-entrypoint.sh kong start
    sleep 5 # Aguarde um pouco antes de reiniciar o Kong
done