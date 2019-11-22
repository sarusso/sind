FROM ubuntu:18.04
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

# Initial apt-get update 
RUN apt-get update

# Dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    uuid-dev \
    libgpgme11-dev \
    squashfs-tools \
    libseccomp-dev \
    pkg-config \
    cryptsetup-bin \
    wget

# Install GO
RUN cd /tmp && wget https://dl.google.com/go/go1.11.linux-amd64.tar.gz
RUN cd /tmp && tar -zxf go1.11.linux-amd64.tar.gz && mv go /usr/local
ENV GOROOT=/usr/local/go
ENV GOPATH=/root/go
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Install Singularity
RUN mkdir -p /usr/local/var/singularity/mnt && \
    mkdir -p $GOPATH/src/github.com/sylabs && \
    cd $GOPATH/src/github.com/sylabs && \
    wget https://github.com/sylabs/singularity/releases/download/v3.4.1/singularity-3.4.1.tar.gz && \
    tar -xzvf singularity-3.4.1.tar.gz
RUN cd $GOPATH/src/github.com/sylabs/singularity && \
    ./mconfig -p /usr/local && \
    make -C builddir && \
    make -C builddir install

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
