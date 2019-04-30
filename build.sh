#! /bin/bash 
set -e
module load intel/compiler/2018u4
CONDA_NAME=inteltf_source_1

# conda setup
# /cm/shared/apps/miniconda/Miniconda3-latest-Linux-x86_64.sh
. ~/miniconda3/bin/activate
conda create --name $CONDA_NAME --clone base
conda activate $CONDA_NAME
pip install --upgrade pip

# spack installs 
git clone https://github.com/spack/spack.git
. spack/share/spack/setup-env.sh
spack install git
spack install gcc@5.4.0

# install tensorflow 
wget https://github.com/bazelbuild/bazel/releases/download/0.19.2/bazel-0.19.2-installer-linux-x86_64.sh
bash bazel-0.19.2-installer-linux-x86_64.sh --prefix=$HOME
export PATH=$HOME/bin:$PATH

git clone https://github.com/tensorflow/tensorflow.git tf_src
cd tf_src
git checkout 9a19de7a0fdfb21e68e6bbd18a488d4c41aa88f5
cd ../
bash ./build_tensorflow.sh 

# benchmark setup
wget https://storage.googleapis.com/intel-optimized-tensorflow/models/resnet50_int8_pretrained_model.pb
git clone https://github.com/IntelAI/models.git intel_models
git clone https://github.com/tensorflow/models.git tf_models
