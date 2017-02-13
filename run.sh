#!/bin/bash

LOCAL_IP=0.0.0.0

docker run --name postgres -v /data/postgres/:/var/lib/postgresql/data -d -p $LOCAL_IP:5432:5432 -e POSTGRES_PASSWORD="" postgres
docker run --name redis -d -p  $LOCAL_IP:6379:6379 redis
