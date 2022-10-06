#!/bin/sh
# set -eux

init_db () {
    DB="test.db"
    cat ./migrations/221006_init_db.sql | sqlite3 $DB
}

init_db