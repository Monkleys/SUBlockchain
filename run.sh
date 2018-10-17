sudo apt install ntpdate
sudo ntpdate ntp.sun.ac.za
#docker build --network=host -t ethtest .
sudo docker pull monkleys/ethtest
sudo docker run --network=host -it -v "${PWD}/here":"/blkchain1" -e TZ=Africa/Johannesburg -e PORT=30303 monkleys/ethtest

