#!/bin/bash
set -e

tiled catalog init TILED_TEST_POSTGRESQL_URI
pwd
python scripts/generate_data.py TILED_TEST_POSTGRESQL_URI
docker exec postgres psql -U postgres -c "SELECT * FROM nodes limit 100;"