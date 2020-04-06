#!/bin/bash

# Install system packages
sudo apt install ffmpeg

# Update conda
conda update -n base -c defaults conda

# Install conda deepfacelab
conda create -n deepfacelab -c main python=3.6.8 cudnn=7.6.5 cudatoolkit=10.0.130


echo ">>> Now type 'conda activate deepfacelab' <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
