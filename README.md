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

## Deployment Workflow

```text
AWS Credentials
       │
       ▼
Terraform
       │
       ▼
Create EC2 Instance
Create Security Group
       │
       ▼
Ansible
       │
       ▼
Install Java
Download Minecraft
Accept EULA
Configure Service
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

## Terraform Deployment

### 1. Initialize Terraform

```bash
cd terraform
terraform init
```

### 2. Review the Execution Plan

```bash
terraform plan
```

### 3. Create the Infrastructure

```bash
terraform apply
```

After deployment, Terraform will output the **public IP address** of the Minecraft server.

---

## Ansible Configuration

Configure the Minecraft server using:

```bash
ansible-playbook -i ansible/inventory.ini ansible/setup_minecraft.yml
```

### Tasks Performed by the Playbook

* Update system packages
* Install Java 25
* Create a dedicated `minecraft` user
* Create the Minecraft server directory
* Download the Minecraft server software
* Accept the Minecraft EULA
* Create a systemd service
* Start and enable the Minecraft service
* Disable automatic server pause when empty

---

## Verification

### Verify the Minecraft Service

```bash
systemctl status minecraft
```

### Verify Port 25565 Is Open

```bash
nmap -sV -Pn -p T:25565 <SERVER_IP>
```

#### Expected Output

```text
25565/tcp open minecraft
```

#### Example Output

```text
25565/tcp open minecraft Minecraft 26.1.2
```

---

## Connecting to the Server

Open **Minecraft Java Edition** and connect using:

```text
<SERVER_IP>:25565
```

### Example

```text
54.235.29.172:25565
```

---

## Helper Scripts

### Deploy Infrastructure

```bash
./scripts/deploy.sh
```

### Configure Minecraft

```bash
./scripts/configure.sh
```

### Test the Server

```bash
./scripts/test_server.sh <SERVER_IP>
```

### Destroy Infrastructure

```bash
./scripts/destroy.sh
```

---

## Cleanup

To remove all AWS resources created by Terraform:

```bash
terraform destroy
```

This command will:

* Terminate the EC2 instance
* Remove the associated security group

---

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
