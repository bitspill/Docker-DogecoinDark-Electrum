# Docker-DogecoinDark-Electrum
https://github.com/bitspill/dogedsource



#Build image  
    docker build -t bitspill/doged github.com/bitspill/Docker-DogecoinDark-Electrum

#Config image
Place electrum-doged.config and electrum-doged.banner in /coins/doged/electrum on the HOST system

#Run image 
    docker run -d --restart=always --name electrumdoged -p 50001:50001
--link dogeddaemon:dogeddaemoncontainer -v /coins/doged:/coin/home bitspill/electrumdoged

