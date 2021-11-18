#!/bin/bash

echo "building a new image..."
docker build -t chenchuk77/serachable-web-node .

echo "removing old instances"
docker stop matkonim-server && echo "stopping old matkonim-server instance" || echo "matkonim-server is not running."
docker rm matkonim-server   && echo "removing old matkonim-server instance" || echo "matkonim-server already removed."

echo "starting a new matkonim-server"
docker run --name matkonim-server -p 80:8080 -d chenchuk77/serachable-web-node

# to debug: change dockerfile to run sleep 600m, then start manually:
#echo "logging in. to start server invoke: node server2.js"
#docker exec -ti matkonim-server /bin/bash

