variable "env" {}

variable "aws_region" {
  type        = string
  description = ""
  default     = "sa-east-1"
}

variable "instance_ami" {
  type        = string
  description = ""
  default     = "ami-0a9e90bd830396d02"

  # A validação vai verificar se o tamanho da ami_instance é maior que 4 e
  # vai tirar os 4 primeiros digitos do ami e eles tem que ser igual a "ami-"
  validation {
    condition     = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"
    error_message = "The instance_ami value must be a valid AMI id, starting with \"ami-\"."
  }
}

variable "instance_number" {
  type = object({
    dev  = number
    prod = number
  })
  description = "Number of instances to create"
  default = {
    dev  = 1
    prod = 3
  }
}

variable "instance_type" {
  type = object({
    dev  = string
    prod = string
  })
  description = ""
  default = {
    dev  = "t3.micro"
    prod = "t3.medium"
  }
}