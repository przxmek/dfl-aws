#!/bin/bash

# Update environment
sudo apt update
conda update -y -n base -c defaults conda
conda init bash

# Install ffmpeg
sudo apt install -y ffmpeg p7zip-full

# Install DeepFaceLab
conda create -y -n deepfacelab -c main python=3.6.8 cudnn=7.6.5 cudatoolkit=10.0.130
conda activate deepfacelab

git clone https://github.com/lbfs/DeepFaceLab_Linux.git
cd DeepFaceLab_Linux
git clone https://github.com/iperov/DeepFaceLab.git
python -m pip install -r ./DeepFaceLab/requirements-cuda.txt


# Download CelebA Dataset
wget https://github.com/iperov/DeepFaceLab/releases/download/06.04.2020/DeepFaceLab_NVIDIA_build_04_06_2020.exe
7z x DeepFaceLab_NVIDIA_build_04_06_2020.exe
rm DeepFaceLab_NVIDIA_build_04_06_2020.exe
mv DeepFaceLab_NVIDIA/_internal/pretrain_CelebA/ .
mv DeepFaceLab_NVIDIA/_internal/pretrain_Quick96/ .
mv DeepFaceLab_NVIDIA/workspace .
rm -r DeepFaceLab_NVIDIA

# Ready to go
cd scripts/
ll

echo ""
echo ">>> Ready to go! Type 'll' to see available scripts. <<<<<<<<<<<<<<<<< "
echo ""