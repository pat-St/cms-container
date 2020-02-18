#!/bin/bash
echo "********* Start Container **********"
docker-compose up
# Delete database user
#rm -f db-content/schema-with-example.sql
