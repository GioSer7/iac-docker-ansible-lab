output "ssh_connection_command" {
  value       = "ssh -i ~/.ssh/iac_lab_key -p 2222 ubuntu@localhost"
  description = "Comando per connettersi al container via SSH"
}

output "web_url" {
  value       = "http://localhost:8080"
  description = "URL per aprire il server web nel browser"
}
