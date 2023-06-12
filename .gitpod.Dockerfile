#FROM gitpod/workspace-postgres:2023-04-20-16-32-37
#FROM gitpod/workspace-postgres:2023-02-27-14-14-03
FROM gitpod/workspace-full:2023-05-02-12-55-13


# This env var is used to force the 
# rebuild of the Gitpod environment when needed
ENV TRIGGER_REBUILD 1

USER root

RUN apt-get update && \
    apt-get install -y wget git tree ssh nano sudo nmap man tmux curl joe && \
    apt-get clean && \
    rm -rf /var/cache/apt/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    pip install dbt-snowflake

# Copy exercices content into the image
# COPY --chown=gitpod content/ /home/gitpod/dbt_audiance_measurment

USER gitpod

# Create empty .dbt directory otherwise dbt complains
RUN mkdir /home/gitpod/.dbt
