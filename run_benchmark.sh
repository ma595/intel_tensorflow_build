#! /bin/bash

. ~/miniconda3/bin/activate 
conda activate inteltf_source
. env.sh

cd ./intel_models/benchmarks

python launch_benchmark.py \
    --in-graph /home/ma595.cambridge/work/resnet50_int8_pretrained_model.pb \
    --model-name resnet50 \
    --framework tensorflow \
    --precision int8 \
    --batch-size=128 \
    --mode inference \
    --benchmark-only \
    --warmup_steps=50 steps=500 \
    --model-source-dir /home/ma595.cambridge/work/tf_models/ \
    -a 40 \
    -e 1 \
    --verbose


#    --docker-image intelaipg/intel-optimized-tensorflow:PR25765-devel-mkl
#--data-location /home/<user>/dataset/FullImageNetData_directory
