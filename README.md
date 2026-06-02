# Minecraft Server Automation Project

## Overview

This project automates the deployment of a **Minecraft Java Edition** server on **AWS** using **Terraform** and **Ansible**.

* **Terraform** provisions the AWS infrastructure, including:

  * EC2 Instance
  * Security Group

* **Ansible** configures the server by:

  * Installing Java
  * Downloading the Minecraft server software
  * Accepting the EULA
  * Configuring the Minecraft service
  * Starting the server automatically

---

## Technologies Used

| Technology            | Purpose                         |
| --------------------- | ------------------------------- |
| AWS EC2               | Virtual server hosting          |
| Terraform             | Infrastructure provisioning     |
| Ansible               | Server configuration management |
| Git                   | Version control                 |
| Amazon Linux 2023     | Operating system                |
| Minecraft Java Server | Game server software            |
| Nmap                  | Network and port verification   |

---

## Project Structure

```text
mc-server-project/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── ansible/
│   ├── inventory.ini
│   └── setup_minecraft.yml
├── scripts/
│   ├── deploy.sh
│   ├── configure.sh
│   ├── test_server.sh
│   └── destroy.sh
└── README.md
```

---

## Automated Deployment Workflow

```text
AWS Credentials
       │
       ▼
deploy.sh
       │
       ├── terraform init
       ├── terraform apply
       └── generate inventory.ini
       │
       ▼
configure.sh
       │
       └── ansible-playbook
              │
              ├── Install Java 25
              ├── Create minecraft user
              ├── Download Minecraft server
              ├── Accept EULA
              ├── Create systemd service
              └── Start Minecraft server
       │
       ▼
test_server.sh
       │
       └── nmap verification
       │
       ▼
Minecraft Server Running
```


---

## Requirements

Before running this project, install and configure the following tools:

* AWS CLI
* Terraform
* Ansible
* Git
* Nmap

### Additional Requirements

* AWS Academy Learner Lab account
* AWS CLI credentials configured on the management server
* An EC2 key pair available in AWS

---

## Quick Start

### Deploy Infrastructure

```bash
./scripts/deploy.sh
```

This script:

* Initializes Terraform
* Creates the AWS infrastructure
* Retrieves the Minecraft server public IP
* Automatically generates the Ansible inventory file

### Configure Minecraft

```bash
./scripts/configure.sh
```

This script:

* Installs Java 25
* Creates the minecraft service account
* Downloads the Minecraft server
* Accepts the EULA
* Creates and enables the systemd service
* Starts the Minecraft server

### Verify Deployment

```bash
./scripts/test_server.sh
```

Expected output:

```text
25565/tcp open minecraft
```

### Destroy Infrastructure

```bash
./scripts/destroy.sh
```

This script removes all AWS resources created by Terraform.

## References

### Terraform

* https://developer.hashicorp.com/terraform/docs

### Ansible

* https://docs.ansible.com/

### AWS EC2

* https://docs.aws.amazon.com/ec2/

### Minecraft Server

* https://www.minecraft.net/en-us/download/server

### Nmap

* https://nmap.org/docs.html
