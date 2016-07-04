#!/bin/bash

echo "[ System setup ]"
echo "Note: PGP key creation will install rng-tools to create entropy."
echo ""
echo "Create SSH keys? (y/n): "
read create_ssh
echo "Create PGP keys? (y/n): "
read create_pgp

echo "Installing system packages ..."
# perform initial repo update
sudo apt-get -y update

# basic packages
sudo apt-get -qq install -y build-essential git zsh zsh-syntax-highlighting vim curl wget openssl gdb coreutils pkg-config make

# some dev libraries
sudo apt-get -qq install -y libxml2-dev libxslt1-dev dpkg-dev autoconf libreadline-dev libdnet-dev libffi-dev libpcap-dev libtool libmagic-dev libfreetype6-dev

# databases
sudo apt-get -qq install -y mongodb sqlite3 postgresl

# useful tools
sudo apt-get -qq install -y zip unzip upx unrar-free jq dnsutils tcpdump httpie

# cli session management
sudo apt-get -qq install -y tmux byobu 

# security and privacy
sudo apt-get -qq install -y tor torsocks tor-arm socat dnscrypt-proxy secure-delete dnssec-tools logcheck logcheck-database


if [[ $create_ssh == "y" || $create_ssh == "Y" || $create_ssh == "yes" ]]; then
    echo "**SSH Key Generation**"
    ssh-keygen -t rsa
fi

if [[ $create_pgp == "y" || $create_pgp == "Y" || $create_pgp == "yes" ]]; then
    echo "**PGP Key Generation**"
    sudo apt-get -qq install -y rng-tools
    sudo rngd -r /dev/urandom
    gpg --gen-key
fi
