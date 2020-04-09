#!/bin/bash

###############################################################################
##                                                                           ##
## Tested on AMIs:
##   - 
##                                                                           ##
###############################################################################

set -e

# Update environment
sudo apt update
sudo apt install -y ffmpeg p7zip-full


echo ">>> Intalling anaconda..."
wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
chmod +x Anaconda3-2020.02-Linux-x86_64.sh
./Anaconda3-2020.02-Linux-x86_64.sh
rm Anaconda3-2020.02-Linux-x86_64.sh
source ~/anaconda3/etc/profile.d/conda.sh

conda init bash
echo ">>> Checking for conda updates..."
conda update -y -n base -c defaults conda

# Install DeepFaceLab
echo ">>> Configuring conda environment for DeepFaceLab..."
conda create -y -n deepfacelab -c main python=3.6.8 cudnn=7.6.5 cudatoolkit=10.0.130
source ~/anaconda3/etc/profile.d/conda.sh # conda init
conda activate deepfacelab

echo ">>> Cloning Git repos for DeepFaceLab..."
git clone https://github.com/lbfs/DeepFaceLab_Linux.git
cd DeepFaceLab_Linux
git clone https://github.com/iperov/DeepFaceLab.git

echo ">>> Installing DeepFaceLab pip requirements..."
python -m pip install -r ./DeepFaceLab/requirements-cuda.txt


# Download CelebA Dataset
echo ">>> Installing pretrained datasets (CelebA, Quick96)..."
wget https://github.com/iperov/DeepFaceLab/releases/download/06.04.2020/DeepFaceLab_NVIDIA_build_04_06_2020.exe
7z x DeepFaceLab_NVIDIA_build_04_06_2020.exe
rm DeepFaceLab_NVIDIA_build_04_06_2020.exe
mv DeepFaceLab_NVIDIA/_internal/pretrain_CelebA/ .
mv DeepFaceLab_NVIDIA/_internal/pretrain_Quick96/ .
mv DeepFaceLab_NVIDIA/workspace .
rm -r DeepFaceLab_NVIDIA

# Ready to go
cd scripts/
ls -al

echo ""
echo ">>> Ready to go! Type 'ls -al' to see available scripts. <<<<<<<<<<<<<<<<< "
echo ""
