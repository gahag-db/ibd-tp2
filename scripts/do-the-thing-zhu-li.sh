#!/usr/bin/env bash

# echo Fetching:
# scripts/fetch-json.sh
# echo

echo Processing.
scripts/process-jsons.sh
echo

echo Normalizing.
scripts/normalize-jsons.py
echo

echo Building sql.
scripts/build-sql.sh
echo

echo Dropping db.
scripts/drop-db.sh
echo

echo Init db.
scripts/init-db.sh
echo
