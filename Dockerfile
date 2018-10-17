#FROM ethereum/client-go

#COPY genesis.json /
#RUN geth --datadir blkchain1 init genesis.json
#ENTRYPOINT geth --datadir blkchain1 --networkid 1234 console --port 30306
FROM ubuntu:18.04

ENV PATH=/usr/lib/go-1.9/bin:$PATH

RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository -y ppa:ethereum/ethereum
RUN apt-get update
RUN apt-get install ethereum -y

EXPOSE 8545
EXPOSE 30303

RUN apt-get install golang-1.10-go -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
#/usr/lib/go-1.10/bin
COPY genesis.json /
RUN geth --datadir blkchain1 init genesis.json
COPY client /client
WORKDIR /client
RUN mkdir -p /blkchain1/geth
RUN touch /blkchain1/geth/static-nodes.json
RUN /usr/lib/go-1.10/bin/go build 
WORKDIR /
ENV IPVAR=146.232.212.65
ENV PORT=30303
ENV TZ Africa/Johannesburg
ENV DEBIAN_FRONTEND=noninteractive
ADD checknode.sh /
RUN chmod +x /checknode.sh
RUN sh -c /checknode.sh
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN ls
ENTRYPOINT /client/client 146.232.212.58 \"enode://$(bootnode -nodekey /blkchain1/geth/nodekey -writeaddress)@${IPVAR}:${PORT}\"; geth --datadir blkchain1 --networkid 4321 console --port $PORT --rpc -rpcport 8545 --ws --wsorigins="*"
