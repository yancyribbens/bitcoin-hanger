FROM ubuntu:18.04
maintainer yancy ribbens "email@yancy.lol"

RUN apt-get update -qq && apt-get install -y \
    git \
    build-essential \
    libtool \
    autotools-dev \
    automake \
    pkg-config \
    libssl-dev \
    libevent-dev \
    bsdmainutils \
    python3 \
    libboost-all-dev \
    curl

# Install Berkley Database
RUN curl -OL http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
RUN tar -xvf db-4.8.30.NC.tar.gz
RUN cd ./db-4.8.30.NC/build_unix && \
    mkdir -p build && \
    ../dist/configure --disable-shared --enable-cxx --with-pic --prefix=/db-4.8.30.NC/build_unix/build && \
    make install

RUN mkdir /usr/local/bitcoin
WORKDIR /usr/local/bitcoin

ENTRYPOINT ["/bin/sh", "-c", "./run_bitcoin.sh"] 
