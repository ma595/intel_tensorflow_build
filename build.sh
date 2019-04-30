#! /bin/bash 

PREFIX=/home/ma595.cambridge/

# conda setup
/cm/shared/apps/miniconda/Miniconda3-latest-Linux-x86_64.sh
conda create --name inteltf_source_1 --clone base
pip install --upgrade pip
conda activate inteltf_source_1

# spack installs 
git clone https://github.com/spack/spack.git
. spack/share/spack/setup-env.sh
spack install git
spack install gcc@5.4.0

# install tensorflow 
wget https://github.com/bazelbuild/bazel/releases/download/0.19.2/bazel-0.19.2-installer-linux-x86_64.sh
bash bazel-0.19.2-installer-linux-x86_64.sh --prefix=${PREFIX}
export PATH=$PREFIX/bin:$PATH

git clone https://github.com/tensorflow/tensorflow.git
git checkout 9a19de7a0fdfb21e68e6bbd18a488d4c41aa88f5
bash ./build_tensorflow.sh 

# benchmark setup
wget https://storage.googleapis.com/intel-optimized-tensorflow/models/resnet50_int8_pretrained_model.pb
git clone https://github.com/IntelAI/models.git intel_models
git clone https://github.com/tensorflow/models.git tf_models
