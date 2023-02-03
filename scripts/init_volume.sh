#!/bin/sh

VOLUME_ROOT_PATH=/mnt/volume_fra1_01

docker volume create --driver local \
    --opt type=none \
    --opt o=bind \
    --opt device=$VOLUME_ROOT_PATH/$1 \
    $2
