#!/bin/bash
set -e

echo "Waiting for Minecraft to start..."
sleep 45

SERVER_IP=$(cd terraform && terraform output -raw minecraft_public_ip)

nmap -sV -Pn -p T:25565 "$SERVER_IP"
