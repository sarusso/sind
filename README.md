# Sind

Singularity in Docker, ready to use.

## Quickstart

### Build or pull

To build from scratch:

    docker build . -t sind

Otherwise, to pull and use the prebuilt Docker images:

    docker pull sarusso/sind && docker tag sarusso/sind sind

### Use

To check that singularity is correctly working inside Docker:

    docker run --privileged -ti sind singularity -v


To build a Singularity image in the current folder:

    docker run --privileged -v $PWD:/data -ti sind singularity build /data/testimage.simg /data/testimage.def


To run a Singularity image in the current folder:

    docker run --privileged -v $PWD:/data -ti sind singularity run /data/testimage.simg


### Debugging

To enter in the Docker container with a shell:

    docker run --privileged -it sind /bin/bash
    root@8852c94cdc5a:/# singularity version
    3.4.1-1



