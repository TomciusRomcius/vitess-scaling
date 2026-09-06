#!/bin/bash

mysql -h 127.0.0.1 -P 15306 -u user \
    -e "SHOW VITESS_SHARDS;"

for shard in '-40' '40-80' '80-c0' 'c0-'; do
    mysql -h 127.0.0.1 -P 15306 -u user \
      --database="db:${shard}@primary" \
      -e "SELECT '$shard' AS shard, \
        (SELECT COUNT(*) FROM users) AS user_count, \
        (SELECT COUNT(*) FROM products) AS product_count, \
        (SELECT COUNT(*) FROM product_reviews) AS product_review_count;"
done