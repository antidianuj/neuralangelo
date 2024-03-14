#!/bin/bash

gdown https://drive.google.com/file/d/1yWoZ4Hk3FgmV3pd34ZbW7jEqgqyJgzHy/view?usp=drive_link --fuzzy -O lego.mp4


SEQUENCE=lego
PATH_TO_VIDEO=lego.mp4
DOWNSAMPLE_RATE=2
SCENE_TYPE=object

bash projects/neuralangelo/scripts/preprocess.sh ${SEQUENCE} ${PATH_TO_VIDEO} ${DOWNSAMPLE_RATE} ${SCENE_TYPE}
