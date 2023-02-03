#!/bin/bash
set -e

clickhouse client -n <<-EOSQL
    CREATE DATABASE wallet;
    CREATE DATABASE deals_history;
EOSQL
