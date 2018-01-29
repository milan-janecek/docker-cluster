#!/bin/bash

if [ -z "$1" ]
then
  echo "ERROR: Script needs one argument => number of a ZKFC."
  exit 1
fi

number=$1

echo "STARTING ZKFC $number"

docker run -dit \
  --name zkfc${number} \
  --network=container:nn${number} \
  --mount type=bind,source=/vagrant/hadoop/share,target=/share \
  hadoop /share/start-zkfc.sh