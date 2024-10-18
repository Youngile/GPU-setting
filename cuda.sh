#!/bin/bash

# NVIDIA CUDA 저장소의 키링 파일을 다운로드합니다.
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb

# CUDA 설치 시 필요한 인증 키 파일을 시스템에 등록합니다.
sudo dpkg -i cuda-keyring_1.1-1_all.deb

# apt 패키지 목록을 업데이트하여 새로운 CUDA 저장소를 반영합니다.
sudo apt-get update

# CUDA 12.2 툴킷을 설치합니다 (-y 옵션은 사용자 확인 없이 설치를 진행함).
sudo apt-get -y install cuda-toolkit-12-2

# CUDA 바이너리 디렉토리를 PATH 환경 변수에 추가하여, CUDA 명령어를 어디서든 사용할 수 있게 합니다.
echo "export PATH=/usr/local/cuda-12.2/bin${PATH:+:${PATH}}" >> ~/.bashrc

# CUDA 라이브러리 디렉토리를 LD_LIBRARY_PATH 환경 변수에 추가하여, 라이브러리가 제대로 로드되도록 합니다.
echo "export LD_LIBRARY_PATH=/usr/local/cuda-12.2/lib64\${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc

# cuDNN (NVIDIA의 CUDA용 딥러닝 라이브러리) 설치합니다.
sudo apt -y install cudnn

