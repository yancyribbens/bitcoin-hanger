#!/bin/sh

LIBTOOL=/usr/local/bitcoin/libtool
if [ ! -f "$LIBTOOL" ]; then
    echo "installing bitcoin"
    ./autogen.sh
    ./configure CPPFLAGS=-"I/db-4.8.30.NC/build_unix/build/include/ -O2" LDFLAGS=-"L/db-4.8.30.NC/build_unix/build/lib/" --without-gui
    make
fi

echo "running bitcoin"
make install
bitcoind
