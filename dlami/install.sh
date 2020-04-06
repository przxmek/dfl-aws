#!/bin/bash

# Update conda
conda update -n base -c defaults conda

conda create -n deepfacelab -c main python=3.6.8 cudnn=7.6.5 cudatoolkit=10.0.130
conda activate deepfacelab

