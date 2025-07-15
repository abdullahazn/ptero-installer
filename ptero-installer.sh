#!/bin/bash

# Script for installing Pterodactyl Panel and Wings
# Created by Abdullah (🦖💻🚀)

# Function to install dependencies
install_dependencies() {
    echo -e "\033[1;34m🚀 Installing necessary dependencies... (Created by \033[1;32mAbdullah 🦖💻)\033[0m"
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install -y \
    nginx \
    curl \
    zip \
    unzip \
    git \
    php-fpm \
    php-cli \
    php-mbstring \
    php-curl \
    php-xml \
    php-mysql \
    php-bcmath \
    php-zip \
    php-gd \
    php-xmlrpc \
    mariadb-server \
    mariadb-client \
    redis-server \
    composer \
    nodejs \
    npm
    echo -e "\033[1;34m✔ Dependencies installed. (Setup by \033[1;32mAbdullah 🦖💻)\033[0m"
}

# Function to install Pterodactyl Panel
install_panel() {
    echo -e "\033[1;34m⚙ Installing Pterodactyl Panel... (Thanks to \033[1;32mAbdullah 🦖💻)\033[0m"
    cd /var/www
    sudo git clone https://github.com/pterodactyl/panel.git pterodactyl
    cd pterodactyl
    sudo composer install --no-dev --optimize-autoloader
    sudo cp .env.example .env
    echo -e "\033[1;34m✔ Pterodactyl Panel installed. (Installation courtesy of \033[1;32mAbdullah 🦖💻)\033[0m"
}

# Function to install Pterodactyl Wings
install_wings() {
    echo -e "\033[1;34m🕊 Installing Pterodactyl Wings... (Installation by \033[1;32mAbdullah 🦖💻)\033[0m"
    cd /var/www
    sudo git clone https://github.com/pterodactyl/wings.git wings
    cd wings
    sudo curl -sSL https://get.pterodactyl.io | bash
    sudo systemctl enable wings
    sudo systemctl start wings
    echo -e "\033[1;34m✔ Pterodactyl Wings installed. (Configured by \033[1;32mAbdullah 🦖💻)\033[0m"
}

# Configure Pterodactyl Panel
configure_panel() {
    echo -e "\033[1;34m⚙ Configuring Pterodactyl Panel... (By \033[1;32mAbdullah 🦖💻)\033[0m"
    cd /var/www/pterodactyl
    sudo php artisan key:generate
    sudo php artisan migrate --seed --force
    sudo chown -R www-data:www-data /var/www/pterodactyl/*
    sudo chmod -R 755 /var/www/pterodactyl/*
    echo -e "\033[1;34m✔ Panel configured. (Setup by \033[1;32mAbdullah 🦖💻)\033[0m"
}

# Set up nginx for Pterodactyl Panel
configure_nginx() {
    echo -e "\033[1;34m🔧 Setting up Nginx... (Thanks to \033[1;32mAbdullah 🦖💻)\033[0m"
    sudo cp /var/www/pterodactyl/nginx/pterodactyl.conf /etc/nginx/sites-available/pterodactyl
    sudo ln -s /etc/nginx/sites-available/pterodactyl /etc/nginx/sites-enabled/
    sudo systemctl restart nginx
    echo -e "\033[1;34m✔ Nginx configured. (Finalized by \033[1;32mAbdullah 🦖💻)\033[0m"
}

# Final setup
final_setup() {
    echo -e "\033[1;34m🔧 Setting up final configurations... (Installation completed by \033[1;32mAbdullah 🦖💻)\033[0m"
    sudo systemctl restart nginx
    sudo systemctl enable nginx
    sudo systemctl enable redis-server
    sudo systemctl restart redis-server
    echo -e "\033[1;34m✔ Final setup completed. Your Pterodactyl Panel and Wings are ready. (By \033[1;32mAbdullah 🦖💻)\033[0m"
}

# Main Execution
install_dependencies
install_panel
install_wings
configure_panel
configure_nginx
final_setup

echo -e "\033[1;32m🎉 Installation completed by Abdullah 🦖💻! All systems are go! 🚀\033[0m"
