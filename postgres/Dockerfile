# Build a modified Postgresql container specifically for running CI Tests
FROM --platform=linux/amd64 docker.io/postgres

# Bring in a postgres config file to set up username and password
COPY postgresql.conf /usr/share/postgresql/postgresql.conf.sample

# Install base utilities
RUN apt-get update && \
    apt-get install -y build-essential  && \
    apt-get install -y wget && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH

# Install tiled (conda)
RUN conda install -y -c conda-forge tiled-client tiled-server

# If DB is empty initialize with tiled test data by running python scripts that are in a parent directory
# RUN tiled catalog init postgresql+asyncpg://postgres:secret@localhost:5432