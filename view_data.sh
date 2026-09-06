#!/bin/bash

mysql -h 127.0.0.1 -P 15306 -u user \
    -e "SHOW VITESS_SHARDS;"

for shard in '-40' '40-80' '80-c0' 'c0-'; do
    mysql -h 127.0.0.1 -P 15306 -u user \
      --database="db:${shard}@primary" \
      -e "SELECT '$shard' AS shard, COUNT(*) AS users FROM users;"
done