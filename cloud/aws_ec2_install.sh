#!/bin/bash

###############################################################################
##                                                                           ##
## Tested on AMIs:
##   - Deep Learning AMI (Ubuntu 18.04) Version 27.0 (ami-008d8ed4bd7dc2485)
##                                                                           ##
###############################################################################
set -e

echo ">>> Installing EFL DL stack. Sit back and relax..."

## Update environment
echo ">>> Installing ffmpeg and 7z..."
sudo apt update
sudo apt install -y ffmpeg p7zip-full

echo ">>> Checking anaconda..."
source ~/anaconda3/etc/profile.d/conda.sh # conda init
echo ">>> Checking for conda updates..."
conda update -y -n base -c defaults conda

### Install DeepFaceLab
echo ">>> Configuring anaconda environment for DeepFaceLab..."
conda create -y -n deepfacelab -c main python=3.6.8 cudnn=7.6.5 cudatoolkit=10.0.130
conda activate deepfacelab

echo ">>> Cloning Git repos for DeepFaceLab..."
git clone https://github.com/lbfs/DeepFaceLab_Linux.git
cd DeepFaceLab_Linux
git clone https://github.com/iperov/DeepFaceLab.git

echo ">>> Installing DeepFaceLab pip requirements..."
python -m pip install -r ./DeepFaceLab/requirements-cuda.txt

### Download CelebA Dataset
echo ">>> Installing pretrained datasets (CelebA, Quick96)..."
wget https://github.com/iperov/DeepFaceLab/releases/download/06.04.2020/DeepFaceLab_NVIDIA_build_04_06_2020.exe
7z x DeepFaceLab_NVIDIA_build_04_06_2020.exe
rm DeepFaceLab_NVIDIA_build_04_06_2020.exe
mv DeepFaceLab_NVIDIA/_internal/pretrain_CelebA/ .
mv DeepFaceLab_NVIDIA/_internal/pretrain_Quick96/ .
mv DeepFaceLab_NVIDIA/workspace .
rm -r DeepFaceLab_NVIDIA

## Ready to go
cd scripts/
ll

echo ""
echo ">>> Ready to go! Type 'll' to see available scripts. <<<<<<<<<<<<<<<<< "
echo ""