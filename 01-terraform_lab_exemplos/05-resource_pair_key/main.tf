provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web" {
  subnet_id = "subnet-041d7c9082c0a8416"
  ami = "ami-0e66f5495b4efdd0f"
  instance_type = "t2.micro"
  key_name = "chave_key_michelle_tf" # a chave que vc tem na maquina pessoal
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-0f2a5e038740095de"]
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-michelle-tf"
  }
  depends_on = [
    aws_key_pair.chave_key
  ]
}

output dns {
  value       = aws_instance.web.public_dns
  description = "DNS para conexão ssh"
 }

resource "aws_key_pair" "chave_key" {
  key_name   = "chave_key_michelle_tf"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuMRw40t6r34JsU/zWqwgrYm15ed1o53H3l2dd67IRDtNULp6gCpRj80vW3qjcUtpyQNjq1ODjv9v9z//HwmKT816ALrZmEygsVusRvkaz3Iat9ezs2PhKsyF67AB3wr4Z+PmJBAemWOZmVYdbqj2ggpMbVh4h7LJfwZf6ieWLTj2fR1NKH7raIKKGF+VpunpVOzkRP5djj29OX4spz91LjUf1BdZJl2ZXd8YaawX0QSUZfygaEGuDInGVPDphXwVcMQXIS5eL2mYUmH2zNdZCV2L+lUo3VcrCinGbl8FkywgxMOlF821T8rImeFbHvNIWRyM3kBicUg0NpWQtAmfmky6jUGiWVj8q1h70ze4vJuvjTlBcwi047BeVcnX11f/6pRw6c5lG9qwaDmW695cgPDziIHX4eWRzvjyI4gpGPGb7fZNg4IzjBSw8rGPDl4UVdwNcp/YC5TpRlRS6fDPCsvi+UbQz7s9DuKvKTucVIOdeqKHkSa/2LY0tee7KTok= ubuntu@dev-michelle" # sua chave publica da maquina 
}