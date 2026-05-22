#!/bin/bash

apt update
apt install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2

echo "<h1> Terraform Practice by Saksham Negi </h1>" | sudo tee /var/www/html/index.html 