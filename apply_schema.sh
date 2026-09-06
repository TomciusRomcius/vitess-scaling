#!/bin/bash
vtctldclient ApplySchema --server=localhost:15999 --sql="$(cat ./sql/create_tables.sql)" db
vtctldclient ApplyVSchema --server=localhost:15999 --vschema="$(cat ./vschema.json)" db
