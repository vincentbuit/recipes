#!/bin/sh
# set -eux

readDb () {
    echo "hallo"
    DB="/home/vin/Repos/recipies/test.db"
    sqlite3 $DB "SELECT * FROM languages;"
}

readDb