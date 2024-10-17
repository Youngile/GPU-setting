#!/bin/bash

# 필수 패키지 설치
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Docker GPG 키 추가
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Docker 저장소 추가
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# NVIDIA Docker GPG 키 추가                                                                                             distribution=$(. /etc/os-release; echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

# 패키지 목록 업데이트
sudo apt update

# NVIDIA Docker 및 도커 설치
sudo apt install -y docker-ce docker-ce-cli docker.io docker-compose-plugin nvidia-docker2

# Docker 데몬 시작
sudo systemctl enable docker --now

# GPU가 잘 인식되는지 확인
sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi

