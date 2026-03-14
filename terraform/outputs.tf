output "instance_public_ip" {
  description = "IP público da instância EC2"
  value       = aws_instance.app.public_ip
}

output "instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.app.id
}

output "app_url" {
  description = "URL de acesso à aplicação"
  value       = "http://${aws_instance.app.public_ip}:5000"
}
