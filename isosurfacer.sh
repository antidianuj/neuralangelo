#!/bin/bash

GROUP=example_group
NAME=example_name

# find logs/${GROUP}/${NAME} -type f -name "epoch*"

for file in $(find logs/${GROUP}/${NAME} -name "epoch*"); do
    filename="${file%.*}"


    CHECKPOINT="${filename}.pt"
    OUTPUT_MESH="${filename}.ply"
    GROUP=example_group
    NAME=example_name
    CONFIG=logs/${GROUP}/${NAME}/config.yaml
    RESOLUTION=2048
    BLOCK_RES=128
    GPUS=1
    torchrun --nproc_per_node=${GPUS} projects/neuralangelo/scripts/extract_mesh.py \
        --config=${CONFIG} \
        --checkpoint=${CHECKPOINT} \
        --output_file=${OUTPUT_MESH} \
        --resolution=${RESOLUTION} \
        --block_res=${BLOCK_RES}


    sleep 5
    
done

echo "Loop completed."

# mv logs/${GROUP}/${NAME}/. logs


# GROUP=example_group
# NAME=example_name
# CHECKPOINT=logs/${GROUP}/${NAME}/epoch_00000_iteration_000000005_checkpoint.pt
# OUTPUT_MESH=logs/${GROUP}/${NAME}/epoch_00000_iteration_000000005_checkpoint.ply
# CONFIG=logs/${GROUP}/${NAME}/config.yaml
# RESOLUTION=256
# BLOCK_RES=16
# GPUS=1
# torchrun --nproc_per_node=${GPUS} projects/neuralangelo/scripts/extract_mesh.py \
#     --config=${CONFIG} \
#     --checkpoint=${CHECKPOINT} \
#     --output_file=${OUTPUT_MESH} \
#     --resolution=${RESOLUTION} \
#     --block_res=${BLOCK_RES}