# Overview
Build scripts for single node inference on Intel Cascade Lake processors

# Pre-build
Run `/cm/shared/apps/miniconda/Miniconda3-latest-Linux-x86_64.sh` to install miniconda3 in `~/miniconda3`

# Build
If necessary, change the conda environment in 'build.sh'
`bash build.sh`

# Run benchmarks 
```bash
srun -N 1 --qos normal -p 6248 --pty /bin/bash -l
bash run_benchmark.sh
```

# Potential issues
The build script didn't install the pip package initially even though tensorflow built successfully. 
If this is the case, do the following: `pip install /tmp/tensorflow_pkg/tensorflow*`
