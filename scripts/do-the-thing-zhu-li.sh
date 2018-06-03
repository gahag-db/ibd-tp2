#!/usr/bin/env bash

time {
  # echo Fetching:
  # scripts/fetch-json.sh
  # echo
  
  echo Processing.
  time scripts/process-jsons.sh
  echo
  
  echo Normalizing.
  time scripts/normalize-jsons.py
  echo
  
  echo Building sql.
  time scripts/build-sql.sh
  echo
  
  echo Dropping db.
  time scripts/drop-db.sh $1
  echo
  
  echo Init db.
  time scripts/init-db.sh $1
  echo
}
