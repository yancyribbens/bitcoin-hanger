# bitcoin-mount
The following steps will create a docker container with all the bitcoin dependencies installed, and then mount the latest bitcoin-core inside the container with two mounted volumes.  The first volume mounts the bitcoin source code for installing and testing changes; the second volume mounts .bitcoin to the home directory for persisting the blockchain and wallet.  Lastly, steps for creating a wallet address are described.

## Setup

1. Clone the repo:
```console
    $ git clone https://github.com/yancyribbens/bitcoin-mount
    $ cd bitcoin-mount
```

2. Build the container and all bitcoind dependencies:
```console
    $ docker build . -t bitcoin-dev
```

3. Clone Bitcoin to a working directory on your local machine, for example to clone Bitcoin in your home directory:
```console
    $ cd ..
    $ git clone https://github.com/bitcoin/bitcoin
    $ cd ./bitcoin
    $ git checkout v0.19.0.1
    $ curl -LJO https://raw.githubusercontent.com/yancyribbens/bitcoin-mount/master/run_bitcoin.sh
    $ chmod 700 run_bitcoin.sh
```

4. Run bitcoin
```console
    $ sudo docker run -v $(pwd):/usr/local/bitcoin -v ~/.bitcoin:/root/.bitcoin -it --name bitcoin-dev-container bitcoin-dev
    $ sudo docker run -v $(pwd):/usr/local/bitcoin -it --name bitcoin-dev-container bitcoin-dev
```

5. Create a new address _after bitcoin has finised installing and running_
```console
    $ docker exec -ti bitcoin-dev-container bash
    $ bitcoin-cli createwallet walletname
    $ bitcoin-cli getnewaddress
    $ bitcoin-cli dumpprivkey {your new address}
```

