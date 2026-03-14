variable "aws_region" {
  description = "Região AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t2.micro"
}

variable "project_name" {
  description = "Nome do projeto usado para taggear os recursos"
  type        = string
  default     = "devops-fase1"
}

variable "allowed_ssh_ip" {
  description = "IP autorizado a acessar via SSH (use seu IP público: curl ifconfig.me)"
  type        = string
  default     = "0.0.0.0/0" # Restrinja em produção!
}
