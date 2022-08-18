locals {

# O número de instancias irá ser definido pela variavel de environment que for
# passada, o lookup irá procurar o instance_number na variavel env
  instance_number = lookup(var.instance_number, var.env)

  file_ext    = "zip"
  object_name = "meu-arquivo-gerado-de-um-template"

  common_tags = {
    "Owner" = "Cayo Dias"
    "Year"  = "2022"
  }
}