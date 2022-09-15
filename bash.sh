#!/bin/bash
STATUS=$(docker inspect --format '{{json .State.Running}}' f88nginx)
if [ "$STATUS" = "true" ]; then
    echo Success > ./log
else 
    docker rm f88nginx
    docker run --name f88nginx -d -p 8888:80 f88nginx 
    echo Active > ./log
fi
