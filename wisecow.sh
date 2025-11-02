#!/bin/bash

COUNTER=0
RESPONSE="HTTP/1.1 200 OK\r\nConnection: keep-alive\r\n\r\n"

while true; do
    {
        echo -e "$RESPONSE"
        /usr/games/fortune | /usr/games/cowsay
        echo
    } | nc -l -p 4499 -q 1 > /dev/null
    COUNTER=$((COUNTER + 1))
    echo "Request $COUNTER processed"
done
