 ansible-playbook -i hosts inicio.yaml -u ubuntu --private-key ~/michelle-rsa-dev-pem

 ssh -i ~/michelle-rsa-dev-pem ubuntu@ec2-18-229-117-203.sa-east-1.compute.amazonaws.com