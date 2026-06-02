variable "aws_region" {
  description = "AWS region used by the learner lab"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type for the Minecraft server"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "AWS key pair name used for SSH and Ansible"
  type        = string
  default     = "minecraft-server-key"
}

variable "my_ip_cidr" {
  description = "Your public IP address in CIDR format for SSH access"
  type        = string
}
