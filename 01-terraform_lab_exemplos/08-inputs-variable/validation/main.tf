variable "image_id" {
  type        = string
  description = "O id do Amazon Machine Image (AMI) para ser usado no servidor."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "O valor do image_id não é válido, tem que começar com \"ami-\"."
  }
 
}

variable "subnet" {
  type        = string
  description = "Digite a subnet."

  validation {
    condition     = length(var.subnet) > 7 && substr(var.subnet, 0, 7) == "subnet-"
    error_message = "O valor da subnet não é válido, tem que começar com \"subnet-\"."
  }
 
}

variable "tamanho" {
  type        = string
  description = "Digite o instance type."

  validation {
    condition     = (var.tamanho) > 8 
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

output "image_id" {
    value = var.image_id
}
output "subnet" {
    value = var.subnet
}
output "tamanho_id" {
    value = var.tamanho
}
output "name_id" {
    value = var.name_id
}