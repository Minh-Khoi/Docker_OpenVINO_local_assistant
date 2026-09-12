#!/bin/bash

# Load environment variables from .env file
set -a
[ -f .env ] && . .env
set +a

# Get the environment variables
PORT=${PORT:-7001}
SOURCE_MODEL=${SOURCE_MODEL:-llmware/llama-3.1-instruct-ov}
TASK_TYPE=${TASK_TYPE:-text_generation}
GPU_or_CPU=${GPU_or_CPU:-GPU}

echo PORT:$PORT
echo SOURCE_MODEL=$SOURCE_MODEL
echo TASK_TYPE=$TASK_TYPE
echo GPU_or_CPU=$GPU_or_CPU

mkdir -p models
# detached from process
# docker run --user $(id -u):$(id -g) -d --device /dev/dri --group-add=$(stat -c "%g" /dev/dri/render* | head -n 1) --rm -p $PORT:$PORT -v $(pwd)/models:/models:rw openvino/model_server:latest-gpu --source_model $SOURCE_MODEL --model_repository_path models --task $TASK_TYPE --rest_port $PORT --target_device $GPU_or_CPU --cache_size 2

# attached to process
docker run --user $(id -u):$(id -g) --device /dev/dri --group-add=$(stat -c "%g" /dev/dri/render* | head -n 1) --rm -p $PORT:$PORT -v $(pwd)/models:/models:rw openvino/model_server:latest-gpu --source_model $SOURCE_MODEL --model_repository_path models --task $TASK_TYPE --rest_port $PORT --target_device $GPU_or_CPU --cache_size 2