#!/bin/sh
PASSWORD=$1

docker run -it --rm \
  --net clickhouse-db \
  --link clickhouse:clickhouse-server \
  clickhouse/clickhouse-client \
  --host clickhouse-db \
  --port 9000 \
  --user super_admin \
  --password "${PASSWORD}"
