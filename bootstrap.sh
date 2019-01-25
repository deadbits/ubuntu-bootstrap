#!/bin/bash
##
# Ubuntu 16.04 bootstrap scripts
# based on osx-bootstrap (https://github.com/divio/osx-bootstrap)
# https://github.com/deadbits/ubuntu-bootstrap
# 
# Comment out any source action you dont want to use.
# View the README.md file for detailed information on the entire process and
# what each script does.
## 

# Require sudo
sudo -v
# sudo keepalive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Ubuntu Boostrap"
echo "***"
echo " "

sudo apt-get -qq install -y git
git config --global credential.helper cache
git clone https://www.github.com/john2c7/ubuntu-bootstrap
#cd ubuntu-bootstrap

clear

work=$HOME/bootstrap-temp
repo=`pwd`

# install system packages and settings
source $repo/core/system.sh

# install conf
source $repo/core/conf.sh

# install nginx and apache web servers
#source $repo/core/webserver.sh

# install python and additional libraries
#source $repo/core/python.sh

# install malware analysis tools
#source $repo/core/malware.sh

# setup Github account
#source $repo/core/github.sh
echo "cleaning up ..."
rm -rf ubuntu-bootstrap
rm -rf conf 
