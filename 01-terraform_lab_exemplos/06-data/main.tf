# provider "aws" {
#   region = "us-east-1"
# }



# resource "aws_instance" "web" {
#   ami           = "${data.aws_ami.ubuntu.id}"
#   instance_type = "t2.micro"
#   tags = {
#     Name = "Maquina de Teste EC2"
#   }
# }
provider "aws" {
  region = "sa-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"] # ou ["099720109477"] ID master com permissão para busca

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-*"] # exemplo de como listar um nome de AMI - 'aws ec2 describe-images --region us-east-1 --image-ids ami-09e67e426f25ce0d7' https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-images.html
  }
}

data http api {
  url = "https://viacep.com.br/ws/05026000/json/unicode/"

  request_headers = {
    Accept = "application/json"
  }
}


output api {
  value       = jsondecode(data.http.api.body).bairro   # traz o bairro conforme informado no http o cep
}


output name {
  value       = data.aws_ami.ubuntu.id
  description = "output de ami"
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com" # outra opção "https://ifconfig.me"
  #url = "https://uol.com.br"  traz todo html da pagina
}

output ip {
  value       = data.http.myip.body
  description = "Meu ip"
  }

resource "aws_security_group" "allow_ssh" {
  name        = "libera_ssh_michelle_tf"
  description = "Allow SSH inbound traffic"
  vpc_id = "vpc-000396ecc50b32b42"

  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = null,
      security_groups = null,
      self            = null
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"],
      prefix_list_ids  = null,
      security_groups  = null,
      self             = null,
      description      = "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "allow_ssh_michelle_tf"
  }
}

# "${chomp( data.http.myip.body )}/32"
