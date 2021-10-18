#!/bin/bash 
sudo apt update -y &&
echo "update foi realizado com sucesso " &&
sudo apt upgrade -y && 
echo "upgrade foi realizado com sucesso" &&
sudo apt install apache2 bind9 dnsutils openssh-server openssh-client whois net-tools && 
echo "instalação dos pacotes (apache2 bind9 dnsutils openssh-server openssh-client whois net-tools) concluida "
