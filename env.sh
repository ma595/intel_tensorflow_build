module load intel/compiler/2018u4
. spack/share/spack/setup-env.sh
. ~/miniconda3/bin/activate 
conda activate my_env
module unload gcc
module load gcc-5.4.0-gcc-7.2.0-l34dbzh
module load git-2.21.0-gcc-7.2.0-jf3lxbm
export PATH=$HOME/bin:$PATH
