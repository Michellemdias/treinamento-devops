resource "aws_key_pair" "chave_key_michelle" {
  key_name   = "chave_key_michelle_tf_nova"
  public_key = var.ssh_pub_key
}