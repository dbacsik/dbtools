# Jupyter
### General Dockerfile for data science projects
### using the Jupyter framework.

# BUILD STAGE
FROM mambaorg/micromamba:1.5.7 AS build

## Install requirements from env.yml
USER root
COPY env.yml /tmp/env.yml
RUN micromamba install -y -n base -f /tmp/env.yml && \
    micromamba clean --all --yes

# FINAL STAGE
FROM quay.io/jupyter/datascience-notebook:2024-09-02 AS final

## Copy the items installed by mamba during the build stage
COPY --from=build /opt/conda/* /opt/conda

## Parameters
ENV PATH="/opt/conda/bin:$PATH"
WORKDIR /home
EXPOSE 8888

## Run commands
### Launch Jupyter notebook server
CMD ["jupyter", "notebook", "--port=888", "--no-browser", "--allow-root"]
