#!/bin/bash
set -e

tiled catalog init $TILED_TEST_POSTGRESQL_URI
pwd
# Run postgres generation script
python scripts/generate_data.py $TILED_TEST_POSTGRESQL_URI
# Run SQLite generation script
tiled catalog init tiled_test_db_sqlite.db
python scripts/generate_data.py tiled_test_db_sqlite.db