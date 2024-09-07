# Jupyter
### General Dockerfile for data science projects
### using the Jupyter framework.

# FINAL STAGE
FROM quay.io/jupyter/datascience-notebook:2024-09-02 AS final

## Install requirements from requirements.txt
USER ${NB_UID}
COPY ./requirements.txt /tmp/requirements.txt
RUN mamba install -c conda-forge -y --file /tmp/requirements.txt && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

## Parameters
WORKDIR /home
EXPOSE 8888
