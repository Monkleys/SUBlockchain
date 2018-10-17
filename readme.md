# Project Title

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

```personal.newAccount()```

You will be asked for a Passphrase, leaving it blank and hitting enter is fine. Repeat.


### To start mining

```miner.start(1)```

`1` in `start()` is the number of CPU threads to use



