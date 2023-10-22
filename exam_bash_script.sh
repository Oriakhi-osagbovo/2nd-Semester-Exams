#!/bin/bash

# Set the variable for the repository URL
REPO_URL="https://github.com/laravel/laravel"

# Set the variable for directory where to clone the PHP application
APP_DIR="/var/www/html/myapp"

# Set variables for mysql
my_database="MYSQL Database"
my_username="Hoosars"
my_password="francis007"

# Update the system
sudo apt update && sudo apt upgrade

# Install the LAMP stack components
echo "Automating the deployment of a LAMP Stack"
sudo apt install -y apache2 mysql-server php

# Clone the PHP application from GitHub
echo "Cloning a PHP Application from GITHUB"
git clone $REPO_URL $APP_DIR

# Install all necessary packages
cd $APP_DIR
composer install

# Configure the Apache web server
echo "Configuring Apache web server with i.p address of Virtual Machine"
sudo a2enmod rewrite
sudo a2ensite 10.0.2.15
sudo systemctl restart apache2

# Secure MySQL installation
echo "Securing MySQL installation"
sudo mysql_secure_installation

# Create a MySQL database for the web application
sudo mysql -u root -p -e "CREATE DATABASE $my_database"

# Grant the web application user access to the database
sudo mysql -u root -p -e "GRANT ALL PRIVILEGES ON $my_database.* TO '$my_username'@'localhost' IDENTIFIED BY '$my_password'"

# Restart the Apache web server
echo "restarting Apache web server"
sudo systemctl restart apache2

# Print a success message
echo "LAMP stack deployment complete!"
