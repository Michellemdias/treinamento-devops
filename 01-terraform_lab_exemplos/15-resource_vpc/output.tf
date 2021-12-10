
output "dns" {
  value = [
    for web in aws_instance.web2 :
    <<EOF
    ssh -i id_rsa ubuntu@${web.public_ip}
    EOF
  ]
}







