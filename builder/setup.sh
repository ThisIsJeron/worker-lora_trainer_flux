#!/bin/bash

# Check if the HUGGINGFACE_API_KEY environment variable is set
if [ -z "$HUGGINGFACE_API_KEY" ]; then
    echo "Error: HUGGINGFACE_API_KEY is not set."
    exit 1
fi

apt-get install ffmpeg libsm6 libxext6  -y

apt-get update && \
apt-get upgrade -y && \
apt-get install -y software-properties-common && \
add-apt-repository ppa:deadsnakes/ppa && \
apt-get update && \
apt-get install -y --no-install-recommends \
    wget ffmpeg libsm6 libxext6 git curl libgl1 libglib2.0-0 libgoogle-perftools-dev \
    python3.10-dev python3.10-tk python3-html5lib python3-apt python3-pip python3.10-distutils && \
apt-get autoremove -y && \
apt-get clean -y && \
rm -rf /var/lib/apt/lists/*

# Clone kohya-ss/sd-scripts
git clone https://github.com/kohya-ss/sd-scripts.git && \
    cd sd-scripts && \
    git checkout main

# Use wget with the Hugging Face token to cache the gated model
wget --header="Authorization: Bearer $HUGGINGFACE_API_KEY" \
     https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors \
     -P /model_cache
