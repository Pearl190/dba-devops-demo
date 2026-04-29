#!/bin/bash

echo "Starting deployment..."

sqlplus $DB_USER/$DB_PASS@$DB_CONN @sql/V1__create_table.sql

if [ $? -ne 0 ]; then
  echo "Error! Rolling back..."
  sqlplus $DB_USER/$DB_PASS@$DB_CONN @sql/rollback/R1__drop_table.sql
  exit 1
fi

echo "Deployment successful!"
