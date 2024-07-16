# Terraform Azure WordPress

O projeto Desafio Extra - Devops utiliza Terraform para provisionar uma VM no Azure, instala Docker e configura containers para WordPress e MySQL usando Docker Compose.

## Pré-requisitos para sua execução

- Conta no Azure.
- Azure CLI instalado e configurado.
- Terraform instalado.

## Instruções para sua execução

1. Inicie o processo de clone do repositório:
    ```bash
    git clone https://github.com/alcantara-roberto/terraform-azure-wordpress.git
    cd terraform-azure-wordpress
    ```

2. Inicie o Terraform:
    ```bash
    terraform init
    ```

3. Execute:
    ```bash
    terraform plan
    ```

4. Aplique:
    ```bash
    terraform apply
    ```

5. Após a execução, o IP público da VM será exibido. Acesse `http://<seu_ip_publico>` para ver o WordPress.

## Configuração

- O arquivo `main.tf` provisiona os recursos necessários no Azure.
- O Docker é instalado e configurado para rodar WordPress e MySQL.
- O arquivo `docker-compose.yml` é utilizado para gerenciar os containers.
- As senhas do banco de dados são configuradas conforme o solicitado.