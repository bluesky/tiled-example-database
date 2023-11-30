#!/usr/env/bin python

# Usage: generate_sample_data.py DATABASE_URI

import sys
from tiled.catalog import from_uri
from tiled.client import Context, from_context
from tiled.server.app import build_app

uri = sys.argv[1]
catalog = from_uri(uri)
with Context.from_app(build_app(catalog)) as context:
    client = from_context(context)
    # Write data