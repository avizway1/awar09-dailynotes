output "public_ip" {
  description = "Launched instance public ip"
  value = aws_instance.instance.public_ip
}

output "private_ip" {
  description = "Launched instance private ip"
  value = aws_instance.instance.private_ip
}