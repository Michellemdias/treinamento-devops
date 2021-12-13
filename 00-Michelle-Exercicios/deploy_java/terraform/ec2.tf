

resource "aws_instance" "web2" {
  subnet_id                   = "subnet-041d7c9082c0a8416"
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.large"
  key_name                    = "michelle-rsa-dev"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.sg_web.id}"
]
  root_block_device {
    encrypted   = true
    volume_size = 50
  }
  
  tags = {
    Name = "grupo5_java"
  }
 
}






