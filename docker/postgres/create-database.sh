#!/bin/bash

echo "****** CREATING VIS DATABASE ******"
gosu postgres postgres --single <<- EOSQL
   CREATE DATABASE jury_summons ENCODING 'UTF8';
EOSQL
echo ""
echo "****** VIS DATABASE CREATED ******"
