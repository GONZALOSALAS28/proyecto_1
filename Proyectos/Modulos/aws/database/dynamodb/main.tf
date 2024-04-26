resource "aws_dynamodb_table" "log-dynamodb-table"{
  name ="${var.nombre-tabla}"$"{var.ambiente}"
  billing_mode = "${var.modo-factura}"
  read_capacity = var.lecturas
  write_capacity = var.escrituras
  hash_key ="${var.clave-hash}"
  range_key ="${var.clave-orden}"

    attribute = {
     name ="${var.clave-hash}"
     type ="${var.tipo-hash}"
    }

    attribute = {
     name ="${var.clave-orden}"
     type ="${var.tipo-orden}"
    }

    tag = {
     name ="${var.nombre-tabla}${var.ambiente}"
     enviroment ="${var.ambiente}"
    }
} 