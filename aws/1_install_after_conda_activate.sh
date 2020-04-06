#!/bin/bash

git clone https://github.com/iperov/DeepFaceLab.git
python -m pip install -r ./DeepFaceLab/requirements-cuda.txt


wget -r 'https://github.com/chervonij/DFL-Colab/releases/download/pretrain-CelebA/pretrain_CelebA.zip' -O pretrain_CelebA.zip
wget -r 'https://github.com/chervonij/DFL-Colab/releases/download/Q96_model_pretrained/Q96_model_pretrained.zip' -O pretrain_Q96.zip

unzip pretrain_CelebA.zip -d pretrain_CelebA/
rm pretrain_CelebA.zip
mv pretrain_CelebA DeepFaceLab_Linux/

unzip pretrain_Q96.zip -d pretrain_Quick96/
rm pretrain_Q96.zip
mv pretrain_Quick96 DeepFaceLab_Linux/


echo "Now navigate to the scripts directory and begin using DeepFaceLab_Linux"
