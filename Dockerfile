# Dockerfile for DogeCoinDark
# http://www.dogecoindark.net/
# https://bitcointalk.org/index.php?topic=1053864.0
# https://github.com/bitspill/electrum-doged-server

FROM ubuntu:latest

MAINTAINER Jeremiah Buddenhagen <bitspill@bitspill.net>

RUN apt-get update && apt-get install -y \
    git \
    libleveldb-dev \
    python \
    python-dev \
    python-pip

RUN pip install ltc_scrypt ecdsa plyvel irc jsonrpclib

RUN git clone https://github.com/bitspill/electrum-doged-server.git /coin/git

WORKDIR /coin/git/

RUN sed 's/if os.getuid() == 0:/if False:/g' -i run_electrum_doged_server

VOLUME ["/coin/home"]

ENV HOME /coin/home

RUN chmod +x /coin/git/run_electrum_doged_server

RUN ln -s /coin/home/electrum/electrum-doged.conf /etc/electrum-doged.conf

ENTRYPOINT ["/coin/git/run_electrum_doged_server"]
#ENTRYPOINT ["/bin/bash"]

# Electrum RPC, Stratum TCP
EXPOSE 8000 50001
