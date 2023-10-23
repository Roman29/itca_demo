output "bastion_ip" {
  value = aws_instance.bastion.public_ip
}

output "ci_cd_ip" {
  value = aws_instance.ci_cd.private_ip
}

output "frontend_ip" {
  value = aws_instance.frontend.private_ip
}

output "backend_ip" {
  value = aws_instance.backend.private_ip
}

output "monitoring_ip" {
  value = aws_instance.monitoring.private_ip
}

output "rds_endpoint" {
  value = aws_db_instance.rds.endpoint
}
