# Project Title: Vnet-subnet-design
# Description
This project focuses on enhancing network security by restricting unauthorized access to a database server. The architecture includes a Virtual Network (VNet) deployed as an isolated network with two segmented subnets.
10.0.1.0/24 – typically used for web servers
10.0.2.0/24 – typically used for database servers

To enforce security boundaries, two Network Security Groups (NSGs) were deployed and associated with each subnet individually. These NSGs implement strict inbound and outbound rules to ensure that only trusted sources within the VNet can access the database server, while blocking any unknown or external traffic.

# Installation instructions:
step1: Creating Resource Group:
       az group create \
  --name rg-labs \
  --location northeurope

step2: Creating Virtual Network/subnests:
       az network vnet create \
  --resource-group rg-labs \
  --name vnet-labs \
  --address-prefix 10.0.0.0/16 \
  --subnet-name subnet-web-labs \
  --subnet-prefix 10.0.1.0/24

az network vnet subnet create \
  --resource-group rg-labs \
  --vnet-name vnet-labs \
  --name subnet-db-labs \
  --address-prefix 10.0.2.0/24

step3: Creating Network Security Groups
       az network nsg create \
  --resource-group rg-labs \
  --name nsg-web-labs

az network nsg create \
  --resource-group rg-labs \
  --name nsg-db-labs

step4: Associating NSG with each Subnet:
az network vnet subnet update \
  --resource-group rg-labs \
  --vnet-name vnet-labs \
  --name subnet-web-labs \
  --network-security-group nsg-web-labs

az network vnet subnet update \
  --resource-group rg-labs \
  --vnet-name vnet-labs \
  --name subnet-db-labs \
  --network-security-group nsg-db-labs

step5: Creating Virtual Machines (Using Linux OS)
step6: Testing Connection using SSH port 22

# Test Connection
step1: Verify the Database Server is Listening on Port 3306
step2: Test Database Port Access from Web Server
screenshot attached

# Architecture Diagram


![image alt](https://github.com/Lola-source2/Vnet-subnet-design/blob/main/Cloud%20Architecture.png)




