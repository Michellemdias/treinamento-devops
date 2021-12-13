terraform {
  backend "remote" {
    organization = "MDIAS"

    workspaces {
      name = "modulo_terraform_michelle"
    }
  }
}