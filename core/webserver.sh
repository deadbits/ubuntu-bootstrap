install_nginx() {
    echo "Installing Nginx ..."
    sudo apt-get -qq install -y nginx
    echo "Replacing Nginx configuration file ..."
    sudo cp $repo/conf/nginx/default /etc/nginx/sites-enabled/default
    sudo service nginx restart
}

install_apache() {
    echo "Installing Apache ..."
    sudo apt-get -qq install -y apache2 apache2-utils ssl-cert libexpat1
    echo "Replacing Apache configuration file ..."
    sudo cp $repo/conf/apache2/ports.conf /etc/apache2/ports.conf
    sudo cp $repo/conf/apache2/000-default.conf /etc/apache2/sites-enabled/000-default.conf
    echo "Installing mod-wsgi ..."
    sudo apt-get -qq install -y libapache2-mod-wsgi
    echo "Restarting the Apache service ..."
    sudo service apache2 restart
}

echo "[ Web server setup ]"
echo "Note: Nginx runs on port 80, Apache runs on port 8888. Edit the files in conf if you want to change this."
echo ""
echo "Install Nginx? (y/n): "
read install_nginx
echo "Install Apache2? (y/n): "
read install_apache

if [[ $install_nginx == "y" || $install_nginx == "Y" || $install_nginx == "yes" ]]; then
    install_nginx
fi

if [[ $install_apache == "y" || $install_apache == "Y" || $install_apache == "yes" ]]; then
    install_apache
fi
