sudo chmod -R 777 here/
sudo apt install ntpdate
sudo ntpdate ntp.sun.ac.za
docker build --network=host -t ethtest .
docker run --network=host -it -v "${PWD}/here":"/blkchain1" -e TZ=Africa/Johannesburg ethtest

