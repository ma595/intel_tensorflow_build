# Overview
Build scripts for single node inference on Intel Cascade Lake processors

# Pre-build
Run `/cm/shared/apps/miniconda/Miniconda3-latest-Linux-x86_64.sh` to install miniconda3 in `~/miniconda3`

# Build
`bash build.sh`

# Run benchmarks 
```bash
srun -N 1 --qos normal -p 6248 --pty /bin/bash -l
bash run_benchmark.sh
```
