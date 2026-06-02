#!/bin/bash
set -e

MY_IP=$(curl -s ifconfig.me)

cat > terraform/terraform.tfvars <<EOF
my_ip_cidr = "$MY_IP/32"
EOF

echo "Updated SSH access IP to: $MY_IP/32"

cd terraform
terraform init
terraform apply -auto-approve

SERVER_IP=$(terraform output -raw minecraft_public_ip)

cd ..

cat > ansible/inventory.ini <<EOF
[minecraft]
$SERVER_IP ansible_user=ec2-user ansible_ssh_private_key_file=/home/ec2-user/.ssh/minecraft-server-key.pem
EOF

echo "Minecraft server IP: $SERVER_IP"
echo "Ansible inventory updated."
