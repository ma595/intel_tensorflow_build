# Overview
Build scripts for single node inference on Intel Cascade Lake processors

# Pre-build
Run `/cm/shared/apps/miniconda/Miniconda3-latest-Linux-x86_64.sh` to install miniconda3 in `~/miniconda3`

# Build
If necessary, change the conda environment name in 'build.sh'. Then run the build script:
```bash
bash build.sh
```

# Run benchmarks 
```bash
srun -N 1 --qos normal -p 6248 --pty /bin/bash -l
bash run_benchmark.sh
```

# Potential issues
The build script didn't install the pip package initially even though tensorflow built successfully. 
If this is the case, do the following: 
```bash
pip install /tmp/tensorflow_pkg/tensorflow*
```

I also decided to install gcc and git (through spack). I am not sure if either of these are necessary as the default environment includes both (gcc-7.2.0 and git-1.8.3.1). These slow the build process considerably. 
