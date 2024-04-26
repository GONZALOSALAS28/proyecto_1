# variables de conectividad Sensibles ,garantizamos seguridad

variable "AWS_ACCESS_KEY_ID" {
  sensitive = true
}

variable "aws_secret_access_key" {
  sensitive = true
}

variable "aws_region" {
  type = string
}

#Variables para el modulo dynamodb

variables "ambiente" {
  description = "puede ser dev, sta , qa ,prd"
  type        = string
}

variable "nombre-tabla" {
  description = "Nombre da la tabla dynamodb para el log de eventos"
  type        = string
}

variable "modo-factura" {
  description = ""
  type        = string

}

variable "Lecturas" {
  description = ""
  type        = string

}

variable "escrituras" {
  description = ""
  type        = string

}

variable "clave-hash" {
  description = ""
  type        = string

}

variable "clave-orden" {
  description = ""
  type        = string

}

variable "tipo-hash" {
  description = ""
  type        = string

}

variable "tipo-orden" {
  description = ""
  type        = string

}

variable "nombre-proyecto"{}
variable "step_function_name"{}

variable "region_lambda" {}
variable "cuenta_aws"{}
variale "directorio-base"{}

# Variable para la lambda 1

variable"lambda_crear_repositorio"{}
variable"handler-para-lambda-1"{}
variable"runtime-para-lambda-1"{}

# Variable para la lambda 2

variable"lambda_inicializar_repositorio"{}
variable"handler-para-lambda-2"{}
variable"runtime-para-lambda-2"{}

# Variable para la lambda 3

variable"lambda_modificar_repositorio"{}
variable"handler-para-lambda-3"{}
variable"runtime-para-lambda-3"{}

# Variable para la lambda 4

variable"lambda_ejecutar_repositorio"{}
variable"handler-para-lambda-4"{}
variable"runtime-para-lambda-4"{}

# Variable para la lambda 5

variable"lambda_validar-capacidad"{}
variable"handler-para-lambda-5"{}
variable"runtime-para-lambda-5"{}






