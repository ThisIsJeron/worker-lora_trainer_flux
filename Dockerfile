# syntax=docker/dockerfile:1.4

# Base image
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu20.04

# Use bash shell with pipefail option
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory
WORKDIR /

# Install system packages, clone repo, and cache models
COPY builder/setup.sh /setup.sh

# Use the Hugging Face API key as a build secret
RUN --mount=type=secret,id=huggingface_key \
    HUGGINGFACE_API_KEY=$(cat /run/secrets/huggingface_key) && \
    bash /setup.sh  # Ensure your setup.sh script uses the HUGGINGFACE_API_KEY variable

# Install Python dependencies (Worker Template)
COPY builder/requirements.txt /requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --upgrade pip && \
    pip install --upgrade -r /requirements.txt --no-cache-dir && \
    rm /requirements.txt

# Add src files (Worker Template)
ADD src /sd-scripts

WORKDIR /sd-scripts

CMD python3 -u handler.py
