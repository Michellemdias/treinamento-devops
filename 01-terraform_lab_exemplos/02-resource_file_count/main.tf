resource "local_file" "teste" {
  count = 3
  filename = "teste${count.index}.txt"
  content = "Olá aluno(s) bem vindo ao terraform ${count.index}.0"
}