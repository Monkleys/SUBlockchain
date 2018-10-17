# SU Blockchain Client

Geth blockchain client for Stellenbosch University.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
Built for debian*

Docker

```sudo apt install docker.io```

ntpdate

```sudo apt install ntpdate```

### Installing


Open `run.sh` and set `IPVAR=` to your external (not localhost or 127.0.0.1) IP address

```
IPVAR=172.15.235.54
```
Run `run.sh`

``` . run.sh```

Wait for geth to start, you should see: `Welcome to the Geth JavaScript console!`. After this type `exit` into the console. This will create all the files you need.

Run `run.sh` again to start the node.
```
. run.sh
```

Running `net.peerCount` in the geth console should yield a number greater than 1


### Getting Eth

Once running type the following into the console:

```personal.newAccount("")```


### To start mining

```miner.start(1)```

`1` in `start()` is the number of CPU threads to use


### Using MetaMask

Install MetaMask extension on chrome

Set a password and create an account

Add a new network by selecting `Custom RPC`

You should use the following address for your RPC

```http://127.0.0.1:8545```

This should connect.

### Adding your wallet to metamask

You need to obtain your private key from the keystore file.

Install ```nodejs``` and ```npm```

Install keythereum

```$ npm install keythereum```

Run nodejs

```$ nodejs```

Import keythereum

```var keythereum = require("keythereum");```

Set your keystore path, change `/home/USER/blockchain/keystore` to your path

```var datadir = "/home/USER/SUBlockchain/here";```

Set your blockchain public address, you can get this by typing `eth.coinbase` into the geth console

```var address = '0x000000000000000000000000000000000000000000000000000000000'```

Set your password, this is the password you chose for your passphrase, the following is for a blank passphrase

```var password = ""```

Run the following 

```var keyObject = keythereum.importFromFile(address, datadir);```

If you get a permissions error, you need to take ownership of the files in `/home/USER/SUBlockchain/here/keystore`

Run

```var privateKey = keythereum.recover(password, keyObject);```

Get the private key buffer

```privateKey```

This will return something like this:

```<Buffer 05 95 b5 5f 0e 31 4a f5 d0 41 40 0c a8 53 87 e2 cd 34 2e a0 62 1f f5 3d dc 58 64 ec 8b 61 23 52>```

Remove the spaces to get your private key:


```0595b55f0e1afd4400ca853872c32ea0621ff53ddc5864ec8b612352```

In Metamask, import a key, use the above as your privatekey.







