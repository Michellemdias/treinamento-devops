#!/bin/bash

terraform init
$(terraform apply -auto-approve | grep "ssh -i")

# Count=0
# while Count=<5;
# do
#   if $(terraform output | grep ssh) #"true"
#   then
#   break;
#   else
#   sleep 1
#   echo "ainda nao esta pronto para conexão"
#   Count=Count+1
#   fi;
# done
