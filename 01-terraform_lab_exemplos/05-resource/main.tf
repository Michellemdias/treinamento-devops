

# //////
variable "image_id" {
  type        = string
  description = "Informar ami."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "O valor do image_id não é válido, tem que começar com \"ami-\"."
  }

}

variable "subnet" {
  type        = string
  description = "Informe a subnet."

  validation {
    condition     = length(var.subnet) > 7 && substr(var.subnet, 0, 7) == "subnet-"
    error_message = "O valor da subnet não é válido, tem que começar com \"subnet-\"."
  }

}

variable "instance" {
  type        = string
  description = "Digite o instance type."

  validation {
    condition     = length(var.instance) >= 8
    error_message = "Por favor preencha uma instance type."
  }

}

variable "name_id" {
  type        = string
  description = "Digite o instance name."

  validation {
    condition     = var.name_id != ""
    error_message = "Por favor preencha uma instance name."
  }

}

variable "qtde" {
  type        = number
  description = "Digite a quantidade de instancia."

  validation {
    condition     = var.qtde < 6
    error_message = "Até 5 maquinas."
  }

}

variable "sc_grp" {
  type        = string
  description = "Digite o security group."

  validation {
    condition     = length(var.sc_grp) > 3 && substr(var.sc_grp, 0, 3) == "sg-"
    error_message = "O nome do security group não é válido."
  }

}

provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web2" {

  subnet_id                   = var.subnet
  ami                         = var.image_id
  count                       = var.qtde
  instance_type               = var.instance
  key_name                    = "michelle-rsa-dev" # a chave que vc tem na maquina pessoal
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.sc_grp]
  root_block_device {
    encrypted   = true
    volume_size = 8
  }
  tags = {
    Name = "${var.instance}-${count.index}"
  }
}

output "public_ip_dns" {
  value =[
    for item in aws_instance.web2:
    <<EOF
    Name: ${item.tags.Name}
    IPV4: ${item.public_ip}  
    DNS:  ${item.public_dns} 
    EOF
  ]
}
# output "public_dns" {
#   value = aws_instance.web2.public_dns[${count.index}]
# }


# "ssh -i chave.pen ubuntu@PUBLIC_DNS"

#resource "aws_key_pair" "chave_key" {
# key_name   = "chave_key"
#public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABUAHUAHuaHaUhAUhAUAiqHA541BsJFngWPqlx27QdAZEWdMLvJv5Wguvatb6LIDo1V3rJ4mUtRRs0o2q3LwYiA5CIkiHFXyNVhXTF1WNAbRossUMsu/BzmgEKyIPPgPHeM0PyRi6FuW1TTZYdnO/GCzJ0UMvZFKnr2g6rELWgdc9Clxz8peNJ+iPJx/sJb+DxTuHDJc1U9eOYS7vlwzsHHApD9O+DbWnpwRpSEuX3vjm5pEEAPqrcBD3HK8kH2qMVRZNxg/fSzSrzjCwFV3ShNbKSTD6HYBV2xCY18mRFjyW94BPSBDGel7/kqTmXY4jtbAoyycWRZJFYhCdzNfItT69nHmsT3i09e0J9jNI6CaameQg/cwIOt8fl+lxUIAufHqFDJPGMJcNFoVR7t7yWPXN3qev2OlGnQONDVlNOmIJDrO+r2QeoVcKaxKye7G3HD3u4HuqGYfL9MtCo6pOZ8IZsCCj2KpS4KQCc="
#}


# /////

# aws_instance.web.public_id