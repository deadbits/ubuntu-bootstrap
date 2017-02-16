[![SayThanks](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg?style=flat)](https://saythanks.io/to/deadbits)  [![Donate](https://img.shields.io/badge/donate-BTC-blue.svg?style=flat)](https://www.coinbase.com/deadbits)

# Ubuntu Bootstrap
Bash script to automate the configuration and package installation for Ubuntu systems.

## Install ubuntu-bootstrap
Run the following command on the Ubuntu box you wish to setup:  
`bash <(curl -L https://raw.github.com/deadbits/ubuntu-bootstrap/master/bootstrap.sh)`
  
This script will first install Git in order to clone this repository, prompt you for your sudo password that is used through-out the rest of the installation, and then proceed with each module.
  
Some individual stages will prompt you to answer yes or no questions for which components you want installed. This process is still very easy, I promise.

## Modules
Please manually review each modules source to make sure you want to perform all of the actions.
If you do not want a specific module to run, just comment out the `source core/<module>.sh` line inside `bootstrap.sh`.

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

## Disclaimer
By using these scripts you acknowledge that the author is not responsible for any misconfigurations, damages, data loss, or other problems that may be caused by the use of these scripts. 
