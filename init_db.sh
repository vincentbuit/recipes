#!/bin/sh
# set -eux

DB="test.db"
cat ./migrations/221006_init_db.sql | sqlite3 $DB
case "$1" in
test)
    echo "generating fake data"
    cat ./migrations/_fake_data.sql | sqlite3 $DB
    ;;
*)
    echo "no arguments were given so no fake data is generated"
    ;;
esac