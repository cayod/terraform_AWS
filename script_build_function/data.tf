data "template_file" "json" {
  template = file("template.json.tpl")

  vars = {
    age    = 25
    eye    = "Brown"
    name   = "Cayo"
    gender = "Male"
  }
}

data "archive_file" "json" {
  type        = local.file_ext
  #path.module é o diretório padrão do terraform
  output_path = "${path.module}/files/${local.object_name}.${local.file_ext}"

  source {
    content  = data.template_file.json.rendered
    filename = "${local.object_name}.json"
  }
}