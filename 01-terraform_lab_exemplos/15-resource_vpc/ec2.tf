

resource "aws_instance" "web2" {
  subnet_id                   = aws_subnet.my_subnet_a.id
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.chave_key_michelle.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  root_block_device {
    encrypted   = true
    volume_size = 8
  }
  count = var.qtde
  tags = {
    Name = "${var.name_id}-${count.index}"
  }
  depends_on = [
    aws_security_group.allow_ssh
  ]
}






