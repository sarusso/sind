#!/bin/bash

if [ $# -eq 0 ]; then
    echo "I am just a container, tell me what command to run inside me (i.e. singularity, bash, ...)"
    exit 1
fi

exec $@
