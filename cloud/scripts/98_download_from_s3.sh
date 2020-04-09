#!/usr/bin/env bash
source env.sh

# rm -r "$DFL_WORKSPACE"

aws s3 sync s3://deepfakelab/DeepFaceLab/Workspace .
unzip workspace.zip
rm workspace.zip
