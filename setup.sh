#!/bin/bash
sudo apt update
sudo apt install -y vim git build-essential pciutils net-tools openssh-server

sleep 5


#기존 드라이버 삭제
#sudo apt-get purge nvidia-driver-*

#생략 가능
#sudo add-apt-repository ppa:graphics-drivers/ppa -y	
#sudo apt-get -y install ubuntu-drivers-common
#sudo ubuntu-drivers devices	생략 가능

#드라이버 설치 및 확인
sudo apt-get install -y nvidia-driver-535

#sh 파일 깃클론
git clone https://github.com/Youngile/GPU-setting.git
mv ./GPU-setting/* .
rm -rf GPU-setting
sudo chmod +x *.sh

#쿠다12.2+cudnn9 설치
./cuda.sh
#nvcc -V #리부팅 후 확인
dpkg -l | grep cudnn

#엔비디아도커설치
./docker.sh
sleep 5

#gpu burn 설치
./burn.sh
#sudo docker run --rm --gpus '"device=0"' gpu_burn	#이미지 런
#sudo docker run -it --rm --gpus '"device=0"' gpu_burn /bin/bash #bash로 실행
#/app/gpu_burn #bash 내부 명령어
sleep 5

#python torch 설치
./codetest.sh
sleep 5

#memtest 설치
./mem.sh

#재부팅
sudo reboot
