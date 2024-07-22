#!/bin/bash

# Atualizar lista de pacotes no sistema
echo "Atualizando lista de pacotes..."
sudo apt-get update -y

# Instalar pacotes necessários
echo "Instalando pacotes necessários..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Adicionar a chave GPG oficial do Docker
echo "Adicionando a chave GPG oficial do Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Adicionar o repositório Docker às fontes do APT
echo "Adicionando o repositório Docker às fontes do APT..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Atualizar a lista de pacotes do APT novamente
echo "Atualizando a lista de pacotes do APT novamente..."
sudo apt-get update -y

# Instalar Docker
echo "Instalando Docker..."
sudo apt-get install -y docker-ce

# Inicializar serviços Docker
echo "Inicializando serviços Docker..."
sudo systemctl start docker
sudo systemctl enable docker

# Adicionar o usuário ao grupo Docker
echo "Adicionando o usuário ao grupo Docker..."
sudo usermod -aG docker adminuser

# Instalar Docker Compose
echo "Instalando Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Criar o arquivo docker-compose.yml
echo "Criando o arquivo docker-compose.yml..."
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

# Mudar permissões do arquivo docker-compose.yml
echo "Mudando permissões do arquivo docker-compose.yml..."
sudo chown adminuser:adminuser /home/adminuser/docker-compose.yml

# Executar Docker Compose para subir os containers
echo "Executando Docker Compose..."
sudo -H -u adminuser bash -c 'docker-compose -f /home/adminuser/docker-compose.yml up -d'

echo "Script de inicialização concluído."
