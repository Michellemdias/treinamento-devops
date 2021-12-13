output "instance_ip_addr" {
  value = [
    aws_instance.web2.public_ip
  ]
 
}


resource "local_file" "hosts" {
  filename = "../ansible/hosts"
  content = <<EOF
[ec2-java-tf]
${aws_instance.web2.public_ip}
EOF
}
