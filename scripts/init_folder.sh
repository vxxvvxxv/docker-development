#!/bin/sh

VOLUME_ROOT_PATH=/mnt/volume_fra1_01

mkdir -p $VOLUME_ROOT_PATH/$1
chgrp docker $VOLUME_ROOT_PATH/$1
chmod 770 $VOLUME_ROOT_PATH/$1
