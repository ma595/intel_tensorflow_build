#! /bin/bash

. ~/miniconda3/bin/activate 
. env.sh

cd ./intel_models/benchmarks

WORK_DIR=/home/ma595.cambridge/work/build/

python launch_benchmark.py \
    --in-graph $WORK_DIR/resnet50_int8_pretrained_model.pb \
    --model-name resnet50 \
    --framework tensorflow \
    --precision int8 \
    --batch-size=128 \
    --mode inference \
    --benchmark-only \
    --warmup_steps=50 steps=500 \
    --model-source-dir $WORK_DIR/tf_models/ \
    -a 40 \
    -e 1 \
    --verbose


#--docker-image intelaipg/intel-optimized-tensorflow:PR25765-devel-mkl
#--data-location /home/<user>/dataset/FullImageNetData_directory
