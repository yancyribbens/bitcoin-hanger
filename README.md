# bitcoin-mount
Steps for running a bitcoin-full node and wallet address creation.  The following steps will create a container with all the bitcoin dependencies, and then mount the latest bitcoin inside the container allowing the blockchain to be persisted.  Lastly, steps for creating a wallet address are provided.

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
    $ sudo docker run -v $(pwd):/usr/local/bitcoin -it --name bitcoin-dev-container bitcoin-dev
```

5. Create a new address _after bitcoin has finised installing and running_
```console
    $ docker exec -ti bitcoin-dev-container bash
    $ bitcoin-cli createwallet walletname
    $ bitcoin-cli getnewaddress
    $ bitcoin-cli dumpprivkey {your new address}
```

