#FROM gitpod/workspace-postgres:2023-04-20-16-32-37
#FROM gitpod/workspace-postgres:2023-02-27-14-14-03
FROM gitpod/workspace-full:2023-05-02-12-55-13


# This env var is used to force the 
# rebuild of the Gitpod environment when needed
ENV TRIGGER_REBUILD 1

USER root

# Install dbt
RUN apt-get update && \
    apt-get install -y wget git tree ssh nano sudo nmap man tmux curl joe && \
    apt-get clean && \
    rm -rf /var/cache/apt/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    pip install "duckdb==0.10.0" "dbt-core==1.7.7" "dbt-snowflake==1.7.1" "dbt-duckdb==1.3.3"

# Install duckdb CLI
RUN wget https://github.com/duckdb/duckdb/releases/download/v0.10.0/duckdb_cli-linux-amd64.zip && \
    unzip duckdb_cli-linux-amd64.zip -d /usr/local/bin/ && \
    rm duckdb_cli-linux-amd64.zip

USER gitpod

# Create empty .dbt directory otherwise dbt complains
RUN mkdir /home/gitpod/.dbt
