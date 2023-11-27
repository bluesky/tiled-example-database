docker run --name tiled-test-postgres -p 5432:5432 -e POSTGRES_PASSWORD=secret -d docker.io/postgres
tiled catalog init postgresql+asyncpg://postgres:secret@localhost:5432
TILED_TEST_POSTGRESQL_URI="postgresql+asyncpg://postgres:secret@localhost:5432" pytest tiled/_tests/test_catalog.py::test_metadata_index_is_used
docker stop tiled-test-postgres
docker commit --change "Insert tiled test data" tiled-test-postgres  bluesky/tiled-test-db:0.0.1