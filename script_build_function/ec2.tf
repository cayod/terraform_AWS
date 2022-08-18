resource "aws_instance" "server" {
  # O count está setando a quantidade de instancias a serem abertas
  # se o valor for menor ou igual a zero ele será zero ou se ele 
  #for maior será o valor informado  
  count = local.instance_number <= 0 ? 0 : local.instance_number

  ami           = var.instance_ami
  
  
  instance_type = lookup(var.instance_type, var.env)

#irá fazer merge de 1 ou mais variaveis do tipo map

  tags = merge(
    local.common_tags,
    {
      Project = "Teste terraform aws"

      #O format passa a variavel como string
      Env     = format("%s", var.env)
      Name    = format("Instance %d", count.index + 1)
    }
  )
}