provider "aws" {
  region = "sa-east-1"
}

module "criar_instancia_da_michelle_micro" {
  source = "github.com/Michellemdias/modulo_devops_terraform_michelle.git"
  nome   = "michelle-terraform-modulo"
  tipo   = "t2.micro"
}