#!/bin/bash

project_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

vtctldclient ApplySchema --server=localhost:15999 --sql="$(cat "$project_root/sql/create_tables.sql")" db
vtctldclient ApplyVSchema --server=localhost:15999 --vschema="$(cat "$project_root/vschema.json")" db
