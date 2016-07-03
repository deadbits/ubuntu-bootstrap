install_python() {
    # bpython is the best interpreter! :D
    echo "Installing core packages ..."
    sudo apt-get -qq install -y python2.7-dev python-setuptools python-pip bpython
    pip install --upgrade setuptools
    pip install --upgrade pip
}

pip_data_libs() {
    echo "Installing data libraries ..."
    pip install scikit-learn matplotlib numpy scipy pandas
}

pip_db_libs() {
    echo "Installing database libraries ..."
    pip install elasticsearch elasticsearch_dsl pymongo redis
}

pip_net_libs() {
    echo "Installing networking libraries ..."
    pip install bottle Flask itsdangerous Jinja2 netaddr pyzmail pcapy scapy \
        simplejson gevent grequests urllib3 requests paramiko flanker tldextract \
        dnspython jsbeautifier ansible boto
}

pip_basic_libs() {
    echo "Intalling basic libraries ..."
    pip install virtualenv virtualenvwrapper configparser urllib3 requests prettyprint six \ 
        python-dateutil chardet psutil PyYAML simplejson jsonschema colorama ConcurrentLogHandler \
        termcolor
}

echo "[ Python setup ]"
install_python
pip_basic_libs
pip_data_libs
pip_net_libs
pip_db_libs
