cd terraform
terraform init
terraform apply -auto-approve

cd ../ansible

ansible-playbook -i hosts inicio.yaml -u ubuntu --private-key ~/michelle-rsa-dev-pem --ssh-common-args='-o StrictHostKeyChecking=no'
