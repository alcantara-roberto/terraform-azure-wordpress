#!/bin/bash

# Atualizar lista de pacotes no sistema
apt-get update

# Instalar o Docker
apt-get install -y docker.io

# Inicializar serviços Docker
systemctl start docker
systemctl enable docker

# Adicionar o usuário ao grupo Docker
usermod -aG docker adminuser

# Instalar Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Criar o arquivo docker-compose.yml
cat <<EOF > /home/adminuser/docker-compose.yml
version: '3.1'

services:

  wordpress:
    image: wordpress
    restart: always
    ports:
      - 80:80
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_PASSWORD: GAud4mZby8F3SD6P
      WORDPRESS_DB_NAME: wordpress

  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: GAud4mZby8F3SD6P
      MYSQL_DATABASE: wordpress
EOF

# Subir os containers
sudo -H -u adminuser bash -c 'docker-compose -f /home/adminuser/docker-compose.yml up -d'

