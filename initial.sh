#!/bin/bash
echo "************* Configuration for the Database: Start       **************"
bash cms-database/initial.sh
echo "************* Configuration for the Database: Finished    **************"
echo "build image"
docker-compose build

read -p "Start the service [Y|n]: " -n 1 -r
echo 
if [[ ! REPLY =~ ^[Yy]$ ]]; then
    echo "start container"
    docker-compose up
fi

