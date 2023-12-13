#!/bin/bash
set -e

tiled catalog init TILED_TEST_POSTGRESQL_URI
pwd
python scripts/generate_data.py TILED_TEST_POSTGRESQL_URI