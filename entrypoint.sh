#!/bin/sh
echo "Cleaning up data for cluster $CLUSTER"
mongo $MONGO_URL --eval "var cluster='$CLUSTER'" mongo.js
