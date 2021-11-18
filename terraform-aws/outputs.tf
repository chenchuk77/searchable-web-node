output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.matkonim_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.matkonim_server.public_ip
}

output "site_url" {
  description = "Website root address"
  value       = "http://${aws_instance.matkonim_server.public_ip}"

}

