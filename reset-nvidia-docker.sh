#!/bin/bash

NVIDIA_DRIVER_VERSION=367.57

docker rm $(docker ps -a -q)
docker volume rm nvidia_driver_$NVIDIA_DRIVER_VERSION
docker volume create --name=nvidia_driver_$NVIDIA_DRIVER_VERSION -d nvidia-docker
nvidia-docker run --rm nvidia/cuda nvidia-smi
export NVIDIA_DRIVER_VERSION
