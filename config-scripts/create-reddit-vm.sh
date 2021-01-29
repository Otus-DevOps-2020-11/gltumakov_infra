#!/bin/bash

yc compute instance create \
  --name reddit-full \
  --memory=4 \
  --create-boot-disk name=disk1,size=10GB,image-id=fd8v13t17a5nlrs3j7qh \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=./metadata.yaml
