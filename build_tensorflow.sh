#! /bin/bash
. env.sh
cd tf_src
bazel --output_user_root=/local/tmp/bazel_out clean
export TF_NEED_JEMALLOC=0
export TF_NEED_GCP=0
export TF_NEED_HDFS=0
export TF_NEED_AWS=0
export TF_NEED_KAFKA=0
export TF_ENABLE_XLA=0

export TF_NEED_GDR=0
export TF_NEED_VERBS=0
export TF_NEED_NGRAPH=0
export TF_NEED_TENSORRT=0

export TF_NEED_OPENCL_SYCL=0
export TF_NEED_COMPUTECPP=0
export TF_NEED_CUDA=0

export TF_NEED_MPI=0
export TF_DOWNLOAD_CLANG=0
export TF_SET_ANDROID_WORKSPACE=0

export PYTHON_BIN_PATH="$(which python)"
export PYTHON_LIB_PATH="$(python -c 'import site; print("\\n".join(site.getsitepackages()))')"
export GCC_HOST_COMPILER_PATH="$(which gcc)"
# export MPI_HOME="$(dirname $(dirname $(which mpirun)))"
export USE_DEFAULT_PYTHON_LIB_PATH=1

export TF_NEED_ROCM=0
# reconsider this export t
export CC_OPT_FLAGS=0

echo $PYTHON_LIB_PATH

./configure 

#pip install keras_preprocessing

bazel --output_user_root="/local/tmp/bazel_out" build --config=mkl -c opt --copt=-mavx --copt=-mavx2 --copt=-mfma --copt=-mavx512f --copt=-mavx512pf --copt=-mavx512cd --copt=-mavx512er //tensorflow/tools/pip_package:build_pip_package

# bazel build --config=mkl --copt="-DEIGEN_USE_VML" -c opt //tensorflow/tools/pip_package:build_pip_package

bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
pip install /tmp/tensorflow_pkg/tensorflow*

# pip install torch
# cd ../horovod
# python setup.py build
# python setup.py install 

