#!/bin/bash

# Atualizar o sistema e instalar Docker
sudo apt-get update
sudo apt-get install -y docker.io

# Iniciar e habilitar o Docker
sudo systemctl start docker
sudo systemctl enable docker

# Adicionar o usuário ao grupo Docker
sudo usermod -aG docker ${ADMIN_USERNAME}

# Instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Criar o arquivo docker-compose.yml
cat << EOF > /home/${ADMIN_USERNAME}/docker-compose.yml
version: '3.1'

services:
  wordpress:
    image: wordpress
    restart: always
    ports:
      - 80:80
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: projetouser
      WORDPRESS_DB_PASSWORD: projetopass
      WORDPRESS_DB_NAME: projetodb

  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_DATABASE: projetodb
      MYSQL_USER: projetouser
      MYSQL_PASSWORD: projetopass
      MYSQL_ROOT_PASSWORD: GAud4mZby8F3SD6P
EOF

# Subir os containers
sudo docker-compose -f /home/${ADMIN_USERNAME}/docker-compose.yml up -d
