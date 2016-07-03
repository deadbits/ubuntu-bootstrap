# Ubuntu Bootstrap
Bash script to automate the configuration and package installation for Ubuntu systems.

## Requirements
- Fresh install of Ubuntu (>= 14.04)

## Install ubuntu-bootstrap
Run the following command on the Ubuntu box you wish to setup:  
`bash <(curl -L https://raw.github.com/deadbits/ubuntu-bootstrap/master/install.sh)`
  
This script will first install Git in order to clone this repository, prompt you for your sudo password that is used through-out the rest of the installation, and then proceed with each stage.
  
Some individual stages will prompt you to answer yes or no questions for which components you want installed. This process is still very easy, I promise.

## Module
This section breaks down what is installed by each module. If you do not want a specific module to run, just
comment out the `source core/<module>.sh` line inside `bootstrap.sh`.

### system.sh
Basic packages from apt-get, some development libraries, extra helpful tools, Tor, logcheck and other basic security
apps. Optionally creates SSH and PGP keys.

### omz.sh
Oh-my-zsh and .zshrc file

### vim.sh
Vimrc file and color schemes

### webserver.sh
Nginx and/or Apache2 with packaged config files.

### python.sh
Python2.7, setuptools/pip, virtualenv, libraries for: data processing, science, databases, networking, web development, useful starter libraries

### malware.sh
Applications and Python libraries useful for malware analysis. Yara, Combine, Viper, PEV, ssdeep, hachoir,
elftools, oletools, etc.

### github.sh
Git configuration and SSH keygen for use on Github

